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
    * _inter-host multi-session Kafka topics_: Each unique host will have a unique kafka topic. 
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
    
*  __Netflow Record__: 

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

 * __Misc__: 
    * `TCCDM_DATUM` records will now explicitly state the record's type.

     
     
Principal
----------

Info           | Provided
---------------|----------
uuid           | V
hostId         | V
type           | PRINCIPAL_LOCAL
userId         | V
username       | X
groupIDs       | V
properties     | cred (uid/euid/suid/fsuid/gid/egid/sgid/fsgid)


Subject
----------

Info           | Provided
---------------|----------
uuid           | V
hostId         | V
properties     | ppid
type           | PROCESS
cid            | V
parentSubject  | V
localPrincipal | V
startTimeStamp | V
cmdLine        | V
unitId         | X
iteration      | X
count          | X
privilegeLevel | X
importedLibs   | X
exportedLibs   | X
properties     | path - The full path to the file being executed.

* Note that Linux kernel does not clearly distinguish threads from processes.
* THEIA reports the *pid* of a *task_struct* as cid, not tgid.
* Theia creates new subject records when a clone system call occurs. From the perspective of the kernel, the new subject will have the cmdLine of its parent. The new process will then possibly run an exec family system call which replaces the parent process's image with the new image, which in turns changes the cmdLine.  In many cases, the new child process will not run an exec syscall and the cmdLine found in the subject record will be accurate. However, if it does uses an exec system call, then TA2 teams should use the cmdLine property provided in an EVENT_EXECUTE record



FileObject
----------

Info           | Provided
---------------|----------
uuid           | V
hostId         | V
properties     | filename, dev, inode
type           | FILE_OBJECT_FILE
epoch          | X
permission     | X
fileDescriptor | X
localPrincipal | V
size           | X
peInfo         | X
hashes         | X

NetFlowObject
----------

Info           | Provided
---------------|----------
uuid           | V
hostId         | V
localAddress   | V 
localPort      | V
remoteAddress  | V
remotePort     | V
epoch          | X
properties     | X
ipProtocol     | X
fileDescriptor | X

* Basically, THEIA's NetFlowObject is created by partially extracting (important) information from struct sockaddr (http://www.retran.com/beej/sockaddr_inman.html).
* Every information was collected as a best-effort manner. Sometimes kernel does not return complete information because of its lazy data allocation.
* Remote connection (Internet connection)
  * Established connection: All localAddress, localPort, remoteAddress, remotePort are filled with values.
  * Non-established connection (a socket has been created and bound to a pair of IP and port, but not yet connected to a remote client or server): localAddress and localPort have values, but remoteAddress and remotePort do not.
    * localAddress == 0.0.0.0 would mean no address has been assigned to this socket yet (https://tools.ietf.org/html/rfc1700)
* Local connection (UNIX domain socket or local Internet connection)
  * UNIX domain socket: localAddress is filled with either LOCAL or a file path (e.g., /tmp/.X11-unix/X0).
    * LOCAL would mean no file path has been assigned to the domain socket yet.
  * Local Internet connection: Both localAddress and remoteAddress are 127.0.0.1. This means that two processes use Internet connection for inter-process communication.
* Netlink connection (a communication mechanism between a user process and kernel)
  * localAddress is filled with NETLINK and localPort is filled with the process ID of a user process (if it is not 0).
* Errors (Default Values) mean that THEIA has failed to retrieve information. Possible reasons include
  * Not-yet supported socket type: raw socket, IPv6 socket, ...
  * No corresponding information (e.g., domain sockets do not need to have remote info).
  * A newly created socket without any address assignment.

MemoryObject
----------

Info           | Provided
---------------|----------
uuid           | V
hostId         | V
memoryAddress  | V
properties     | X
epoch          | X
size           | V
pageNumber     | X
pageOffset     | X

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
hostId         | uuid
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


* THEIA is an event (syscall)-based system such that it may not be able to provide detailed information of certain subjects and objects when they were created before THEIA starts to monitor the system execution.

syscall    | Event type                | Predicate Objs       | location | size          | Properties                         
-----------|---------------------------|----------------------|----------|---------------|------------------------------------                            
clone      | CLONE                     | child process        |          |               |                                 
execve     | EXECUTE                   | file                 |          |               | cmdLine
setuid     | CHANGE_PRINCIPAL          | principal            |          |               | newuid, rc                         
mmap       | MMAP                      | memory, file         |          | length        |                                    
munmap     | OTHER                     | memory               |          | length        |                                    
mprotect   | MPROTECT                  | memory               |          |               | address, length, protection        
open       | OPEN                      | file                 |          |               |                                    
read       | READ                      | file or netflow      | offset   | bytesRead     |                                    
write      | WRITE                     | file or netflow      | offset   | bytesWritten  |                                    
pipe       | CREATE_OBJECT             | pipe object          |          |               |                                    
accept     | ACCEPT                    | netflow              |          |               | return_value                       
connect    | CONNECT                   | netflow              |          |               | return_value                       
send       | SENDTO                    | netflow              |          |               |                                    
sendto     | SENDTO                    | netflow              |          |               |                                    
sendmsg    | SENDMSG                   | netflow              |          |               |                                    
recv       | RECVFROM                  | netflow              |          |               |                                    
recvfrom   | RECVFROM                  | netflow              |          |               |                                    
recvmsg    | RECVMSG                   | netflow              |          |               |                                    
ioctl      | FCNTL                     | file                 | command  |               |                                    
mount      | MOUNT                     |                      |          |               |  devname, dirname, type, flags, rc  
shmat      | SHM                       | file,memory          |          |               |  shmid, shmaddr, shmflg, rc, raddr  
chown      |  MODIFY_FILE_ATTRIBUTES   | file, principial     |          |               |  uid, gid
fchown     |  MODIFY_FILE_ATTRIBUTES   | file, principial     |          |               |  uid, gid
fchownat   |  MODIFY_FILE_ATTRIBUTES   | file, principial     |          |               |  uid, gid
lchown     |  MODIFY_FILE_ATTRIBUTES   | file, principial     |          |               |  uid, gid
chmod      |  MODIFY_FILE_ATTRIBUTES   | file                 |          |               |  mode
fchmod     |  MODIFY_FILE_ATTRIBUTES   | file                 |          |               |  mode
fchmodat   |  MODIFY_FILE_ATTRIBUTES   | file                 |          |               |  mode

Note
--------
* We provide *uuid*, *type*, *threadId*, *sequenceId*, *subject*, *timestamp*, and *name* (syscall) of events.
* We do not provide  *predicateObjectPath*, *predicateObject2Path*, *parameters*, and *programPoint*.
** 

