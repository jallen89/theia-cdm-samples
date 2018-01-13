Theia CDM18 Mapping
====================

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
cmdLine        | X
unitId         | X
iteration      | X
count          | X
privilegeLevel | X
importedLibs   | X
exportedLibs   | X

* Note that Linux kernel does not clearly distinguish threads from processes.
* THEIA reports the *pid* of a *task_struct* as cid, not tgid.

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

* THEIA creates a new FileObject whenever a file has been updated (e.g., write syscall) for versioning.
* It is better to use inode and/or path to link different versions of the same file.

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

syscall    | Event type       | Predicate Objs       | location | size          | Properties                         
-----------|------------------|----------------------|----------|---------------|------------------------------------                            
clone      | CLONE            | child process        |          |               |                                    
execve     | EXECUTE          | file                 |          |               | cmdLine
setuid     | CHANGE_PRINCIPAL | principal            |          |               | newuid, rc                         
mmap       | MMAP             | memory, file         |          | length        |                                    
munmap     | OTHER            | memory               |          | length        |                                    
mprotect   | MPROTECT         | memory               |          |               | address, length, protection        
open       | OPEN             | file                 |          |               |                                    
read       | READ             | file or netflow      | offset   | bytesRead     |                                    
write      | WRITE            | file or netflow      | offset   | bytesWritten  |                                    
pipe       | CREATE_OBJECT    | file1, file2 (bug)   |          |               |                                    
accept     | ACCEPT           | netflow              |          |               | return_value                       
connect    | CONNECT          | netflow              |          |               | return_value                       
send       | SENDTO           | netflow              |          |               |                                    
sendto     | SENDTO           | netflow              |          |               |                                    
sendmsg    | SENDMSG          | netflow              |          |               |                                    
recv       | RECVFROM         | netflow              |          |               |                                    
recvfrom   | RECVFROM         | netflow              |          |               |                                    
recvmsg    | RECVMSG          | netflow              |          |               |                                    
ioctl      | FCNTL            | file                 | command  |               |                                    
mount      | MOUNT            |                      |          |               | devname, dirname, type, flags, rc  
shmat      | SHM              | file,memory          |          |               | shmid, shmaddr, shmflg, rc, raddr  

Note
--------
* We provide *uuid*, *type*, *threadId*, *sequenceId*, *subject*, *timestamp*, and *name* (syscall) of events.
* We do not provide  *predicateObjectPath*, *predicateObject2Path*, *parameters*, and *programPoint*.

