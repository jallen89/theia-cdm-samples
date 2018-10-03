Theia CDM~~18~~19 Documentation
====================

CDMv19 Updates
---------
* __CDM Session Streams__: 
    * _session stream ID_: A monotonically increasing session ID will be added to every `TCCDM_DATUM` record. 
    A new session will begin at every `HOST_RECORD`, and a session will end when a `HOST_RECORD` with a 
    new session number occurs. In almost all cases, a new session will begin when Theia's target system 
    is rebooted. 

  * _Sessions and UUID Uniqueness_: __A UUID can appear in multiple sessions, and if this is the case,
    it means Theia is providing a version of this object based on its state in
    the current session. If a topic contains two records with the same UUID, it means these two records
    represent the same object, but from different sessions__. Records with larger sequence stream IDs 
    obviously represent a more recent description of the object's state. For example, if a file's permissions 
    have been modified, the file record with the highest session number will represent the most-current state of 
    this record. 

    uuid | filename | session 
    -----|----------| ---------
    0100d00f-3d07-4600-0000-00003f56565b | /home/joey/ripe-prov-tests/Linux/bash_commands.sh | 0
    0100d00f-3d07-4600-0000-00003f56565b | /home/joey/ripe-prov-tests/Linux/bash_commands.sh | 1


  *  _per-session def-use provenance data_ : Theia will define all records in a
     session before they are used, which is necessary for intra-session
     analysis. Aditionally, for _inter-session analysis_, the provenance graph
     will have all nodes defined before they are used. 

* __Kafka Topics__: 
    * _single-host multi-session Kafka topics_: Each unique host will have a unique kafka topic. 
    All sessions from the same host will be posted to the same topic. If two records 
    with the same UUID are found in the same topic, it means Theia observed this record was used 
    in  two unique sessions, and Theia is providing an updated record that provides a snapshot 
    of the records state during its _first_  use in a session.


* __Standarization__: 
    * _Partially Constructed Records_: In some cases, the Linux kernel does not
      provide Theia with every possible field in a CDM record. This is due to the 
      kernel relying on lazy data allocation for performance reasons. In this
      situation, we designed Theia to fallback on _partial record construction_, which
      allows Theia to report the meaningful fields that are actually
      extractable.  For engagement 4, all meaningful fields extracted will have
      the appropriate values, while any remaining fields will maintain the
      standard default value. This will allow TA2 teams to focus on the most meaingingful
      fields in a record, and avoiding unnecessary parsing exceptions.
    
* __Netflow Record__: 

    * _Addresses and Ports_: localAddress and remoteAddress fields will no longer contain 
    "NA" values. Instead, when Theia uses partial event reconstruction, the default standardized None 
    value will be used. This allows us to still provide meanginful information,
    without adding unique values into the CDM. Additionally, netflow records' _localPort_ and _remotePort_ fields 
    will be set to their respective default values when the localAddress or remoteAddress values were not provided
    by the kernel 
    respectively (Issue 115).

    * _Unix Domain Sockets_ (in progress): Netflow Records will no longer be used to model
      Unix Domain sockets, which are used for intra-host inter-process
      communication. Instead, the new IPCObject Record type (Issue 112) will be
      used instead. Please see `Unix Domain Sockets` section below. 

* __File Record__:
    * The `inode` and `device` value in the property map are represented by hex
      strings (`Record['properties']['inode'] = "0x1234"`). 
    * In rare cases, Theia reported negative inode and device identifiers during
      engagement 3. This issue has been fixed. 
    * The ids (uid,gid) for a file are always reported in a file object's
      property map. The format is `Record['properties']['ids'] = "<uid>/<gid"`. 
      The ids represent the ids for a file based on their values when the file
      was first logged by Theia.

* __Memory Record__:
    * The flags used during a `mmap` syscall will be provided in the
      property map in human-readable form ` "flags":
      "MAP_PRIVATE|MAP_ANONYMOUS|MAP_GROWSDOWN"`.
    * The protection properties of a memory object will now be provided in the
      property map in human-readable form: `"prot": "PROT_READ|PROT_EXEC"`.

* __Events__:
    * During engagement 3, `EVENT_READ_SOCKET_PARAMS` and
      `EVENT_WRITE_SOCKET_PARAMS` were used to model read and writes from
      sockets respectively. For engagement 4, we will model read and writes from 
      sockets using  `EVENT_READ` and `EVENT_WRITE` instead. When a read or
      write event from a socket is reported, the event's `predicateObject1` field 
      will be set to the netflow object or IPC object's  UUID.
    * `EVENT_OPEN` will now provide the flags arguments in human-readable form
      in the property map `flags ":"O_WRONLY|O_CREAT|O_TRUNC"`.
    * New Events Supported: `EVENT_CORRELATE`, `EVENT_EXIT`

* __UI Events__:
    * Current support for providing UI information in CDM data is best effort, and focus soley on mouse click (no keyboard support). It has been tested on both Firefox and Nautilus (Linux's file manager).
    * UI information will be provide in properties map of the receive event record which corresponds to the receiving of the X11 button release event.
    * Currently we provide the following information of the UI element that is clicked (using the corresponding keys in the properties map):
      * app.name: name of the application which contains the UI clicked
      * name: descriptive name of the clicked UI, for links in browser, that's the anchor text, for buttons on web form, that's usually the words on the button. Other example include the name of the file/folder icon clicked in Nautilus
      * role: the role of the clicked UI (according to Linux accessibility standards). Examples include links, push buttons, icons
      * url: this applies to links in a browser only, and it's the target URL of the clicked link
      * window: this is the name of the window that contains the clicked UI, hopefully can provide some more context for the click
      * src_url: this also applies a browser only, and it's the URL displayed in the address bar when a link is clicked (i.e. the URL of the page in which the click happens)
      * time: this is for internal use, signifies the time (in ms) when the UI event is RECEIVED (but not processed), which helps us sync up events

 * __Misc__: 
    * `TCCDM_DATUM` records will now explicitly state the record's type.

     
     
Principal
----------

Info           | Provided
---------------|----------
uuid           | V
type           | PRINCIPAL\_LOCAL
userId         | V
groupIDs       | V
properties     | uid, gid


Subject
----------

Info           | Provided
---------------|----------
uuid           | V
type           | PROCESS
cid            | V
parentSubject  | V
localPrincipal | V
startTimeStamp | V
cmdLine        | V
properties     | path, uid, euid, suid, fsuid, gid, egid, sgid, fsgid

* Note that Linux kernel does not clearly distinguish threads from processes.
* THEIA reports the *pid* of a *task_struct* as cid, not tgid.
* Theia creates new subject records when a clone system call occurs. From the perspective of the kernel, 
the new subject will have the cmdLine of its parent. The new process will then possibly run an exec 
family system call which replaces the parent process's image with the new image, which in turns changes 
the cmdLine.  In many cases, the new child process will not run an exec syscall and the cmdLine found in 
the subject record will be accurate. However, if it does uses an exec system call, then TA2 teams should 
use the cmdLine property provided in an EVENT\_EXECUTE record



FileObject
----------

Info           | Provided
---------------|----------
uuid           | V
properties     | filename, dev, inode, uid, gid
type           | FILE\_OBJECT\_FILE
localPrincipal | V

* inode and dev (device) are provided as hex strings.


NetFlowObject
----------

Info           | Provided
---------------|----------
uuid           | V
localAddress   | V 
localPort      | V
remoteAddress  | V
remotePort     | V

* Remote connection (Internet connection)
  * Established connection: All localAddress, localPort, remoteAddress, remotePort are filled with values.
  * Non-established connection (a socket has been created and bound to a pair of IP and port, but not yet connected to a remote client or server): 
        localAddress and localPort have values, but remoteAddress and remotePort do not.
 * localAddress == 0.0.0.0 would mean no address has been assigned to this socket yet (https://tools.ietf.org/html/rfc1700)

IPCObject
----------

Info           | Provided
---------------|----------
uuid           | V
type           | V
properties     | type, path

* __Unix Domain Sockets__: Theia uses the new IPC Record to model Unix domain sockets,
which are used for communication between two processes on the same host, and they do not cross 
the host boundary. Additionally, there are three flavors of domain sockets: _pathname_, _abstract_, 
and _unnamed_. Theia models all three using the IPCRecord, and uses the _type_ field to specify the difference. 
    * For domain sockets of type _pathname_, the socket is bound to a file,
      and Theia provides the path of this file in the property map.
    * _abstract_ domain sockets leverage a unique string for identification,
      and Theia will provided this unique string in the _path_ field. 
    * For _unnamed_ sockets, we do not provide the _path_ field, and it should
      be ignored if this is the case. 
* __Netlink Sockets__: Netlink sockets are used for communication between
  the kernel and a user process. Theia uses IPCObjects to model communication
  through netlink sockets. Unfortunately, NETLINK is not a type that provided
  in by the `IPCRecordType` enum. To identify when a netlink socket is used, we
  provide an additional key in the property map `type`, which will always be
  set to NETLINK.


MemoryObject
----------

Info           | Provided
---------------|----------
uuid           | V
memoryAddress  | V
properties     | flags, prot
size           | V

* In some cases, Theia cannot report the flags or prot values. If this is the
      case, the keys will not be placed in the property map.

TheiaQuery
----------

parameters     | value
---------------|----------
queryId        | uuid
type           | BACKWARD (will be supported), FORWARD (partially supported), POINT_TO_POINT
sourceId       | uuid
sinkId         | uuid
startTimestamp | start time of suspicious events to filter out old events
endTimestamp   | end time of suspicious events to filter out future events

TheiaQueryResult
----------

parameters     | value
---------------|----------
queryId        | uuid
tagIds         | an array of tag uuids

* THEIA's query system supports instruction-level dynamic information flow tracking (DIFT) by replaying the execution of certain processes.
* Currently, we need to explicitly specify source and sink UUIDs to perform DIFT.
* If tagIds is null, it implies that there was no information flow between source and sink UUIDs.

ProvenanceTagNode
----------

parameters     | value
---------------|----------
tagId          | uuid
flowObject     | uuid
subject        | uuid
systemCall     | syscall name
programPoint   |  X
prevTagId      |  X
opcode         | opcode
tagIds         | uuids
itag           |  X
ctag           |  X
properties     |  X


UnnamedPipeObject
----------
* Not available
* Currently, THEIA represents pipe as an event

RegistryKeyObject
----------
* Not available
* It is for Windows, so THEIA has no plan to support it

SrcSinkObject
----------
* Not available

UnitDependency
----------
* Not available

TimeMarker
----------
* Not available
* Currently, THEIA generates all events in order such that TimeMarker would be not needed.


Events
------

* THEIA is an event (syscall)-based system such that it may not be able to provide detailed information of certain subjects and objects 
when they were created before THEIA starts to monitor the system execution.

syscall    | Event type                 | Predicate Objs        | Predicate Obj2     | size          | Properties                         
-----------|----------------------------|-----------------------|--------------------|---------------|------------------------------------                            
clone      | CLONE                      | child process         |                    |               | 
execve     | EXECUTE                    | file                  |                    |               | cmdLine
exit       | EXIT                       | X                     |                    |               |
setuid     | CHANGE\_PRINCIPAL          |                       |                    |               | newuid, rc                         
mmap       | MMAP                       | memory, file          | file               | length        | flags, prot
munmap     | OTHER                      | memory                |                    | length        |                                    
mremap     | CORRELATE                  | new memory object     | old memory object  |               | 
mprotect   | MPROTECT                   | memory                |                    |               | address, length, prot
open       | OPEN                       | file                  |                    |               | flags
unlink     | UNLINK                     | file                  |                    |               | 
read       | READ                       | file or netflow, ipc  |                    | bytesRead     |                                    
write      | WRITE                      | file or netflow, ipc  |                    | bytesWritten  |                                    
pipe       | CREATE\_OBJECT             | pipe object           |                    |               |                                    
accept     | ACCEPT                     | netflow, ipc          |                    |               | rc
connect    | CONNECT                    | netflow, ipc          |                    |               | rc
send       | SENDTO                     | netflow, ipc          |                    |               |                                    
sendto     | SENDTO                     | netflow, ipc          |                    |               |                                    
sendmsg    | SENDMSG                    | netflow, ipc          |                    |               |                                    
recv       | RECVFROM                   | netflow, ipc          |                    |               |                                    
recvfrom   | RECVFROM                   | netflow, ipc          |                    |               |                                    
recvmsg    | RECVMSG                    | netflow, ipc          |                    |               |                                    
ioctl      | FCNTL                      | file                  | command            |               |                                    
mount      | MOUNT                      |                       |                    |               |  devname, dirname, type, flags, rc  
shmat      | SHM                        | file,memory           |                    |               |  shmid, shmaddr, shmflg, rc, raddr  
chown      | MODIFY\_FILE\_ATTRIBUTES   | file                  |                    |               |  uid, gid
fchown     | MODIFY\_FILE\_ATTRIBUTES   | file                  |                    |               |  uid, gid
fchownat   | MODIFY\_FILE\_ATTRIBUTES   | file                  |                    |               |  uid, gid
lchown     | MODIFY\_FILE\_ATTRIBUTES   | file                  |                    |               |  uid, gid
chmod      | MODIFY\_FILE\_ATTRIBUTES   | file                  |                    |               |  mode
fchmod     | MODIFY\_FILE\_ATTRIBUTES   | file                  |                    |               |  mode
fchmodat   | MODIFY\_FILE\_ATTRIBUTES   | file                  |                    |               |  mode

Note
--------
* We provide *uuid*, *type*, *threadId*, *sequenceId*, *subject*, *timestamp*, and *name* (syscall) of events.
* We do not provide  *predicateObjectPath*, *predicateObject2Path*, *parameters*, and *programPoint*.
** 

