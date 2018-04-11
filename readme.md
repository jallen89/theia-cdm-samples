Theia CDM18 Mapping
====================

Engagement 3 Topics
---------


#### Week 1


Topic Name               | Start timestamp | End timestamp | Start Time                              | End Time                               |
-------------------------|-----------------|---------------|-----------------------------------------|--------------------------------------  |
ta1-theia-e3-official    | 1522704214      | 1522763431    | Monday, April 2, 2018 5:23:34 PM EST    | Monday, April 2, 2018 9:04:53 PM EST   | 
ta1-theia-e3-official-1* | 1522764134      | 1522776213    | Tuesday, April 3, 2018 10:02:14 AM EST  | Tuesday, April 3, 2018 1:23:33 PM EST  |
ta1-theia-e3-official-1r*| 1522764134      | 1522941541    | Tuesday, April 3, 2018 10:02:14 AM EST  | Thursday, April 5, 2018 11:19:01 AM EST|
ta1-theia-e3-official-4  | 1522964107      | 1522976758    | Thursday, April 5, 2018 5:35:07 PM EST  | Thursday, April 5, 2018 9:05:58 PM |
ta1-theia-e3-official-5  | 1523086732      | 1523086732    | Friday, April 6, 2018 9:59:31 AM EST    | Saturday, April 7, 2018 3:38:56 AM EST |  

\* ta1-theia-e3-official-1 is a subset of ta1-theia-e3-official-1r. TA2 teams should use ta1-theia-e3-official-1r for analysis.

#### Week 2

Topic Name               | Start timestamp | End timestamp | Start Time                              | End Time                               |
-------------------------|-----------------|---------------|-----------------------------------------|--------------------------------------  |
ta1-theia-e3-official-5m | 1523277850      | 1523312112    | Monday, April 9, 2018 8:44:10 AM EST    | Monday, April 9, 2018 6:15:12 PM EST   |
ta1-theia-e3-official-6r | 1523378673      | Present       | Tuesday, April 10, 2018 12:44:33 AM EST | Present                                |

* ___All other topics should not be used for analysis.___
* ___UUIDS are not unique across topics.___


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
* Errors ("NA") mean that THEIA has failed to retrieve information. Possible reasons include
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
pipe       | CREATE_OBJECT             | file1,               |          |               |                                    
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

