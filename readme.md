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
properties     | filepath, ppid
type           | PROCESS
cid            | V
parentSubject  | V
localPrincipal | V
startTimeStamp | V
cmdLine        | executable path (arguments are not available for now)
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
properties     | inode, minor, major, generation, path, version (will be provided)
type           | FILE_OBJECT_FILE
epoch          | X
permission     | X
fileDescriptor | X
localPrincipal | X
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
* Not available

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

Note
--------
* THEIA is an event (syscall)-based system such that it may not be able to provide detailed information of certain subjects and objects when they were created before THEIA starts to monitor the system execution.
syscall    | Event type       | Predicate Objs       | location | size          | Properties                         
-----------|------------------|----------------------|----------|---------------|------------------------------------                            
clone      | CLONE            | child process        |          |               |                                    
execve     | EXECUTE          | process, file        |          |               |                                    
setuid     | CHANGE_PRINCIPAL | principal            |          |               | newuid, rc                         
mmap       | MMAP             | memory, file         |          | length        |                                    
munmap     | OTHER            | memory               |          | length        |                                    
mprotect   | MPROTECT         | memory               |          |               | address, length, protection        
open       | OPEN             | file                 |          |               |                                    
read       | READ             | file                 | offset   | bytesRead     |                                    
write      | WRITE            | file                 | offset   | bytesWritten  |                                    
pipe       | CREATE_OBJECT    | file1, file2 (bug)   |          |               |                                    
accept     | ACCEPT           | netflow              |          |               | return_value                       
connect    | CONNECT          | netflow              |          |               | return_value                       
send       | SENDTO           | netflow              |          | bytesSent     |                                    
sendto     | SENDTO           | netflow              |          | bytesSent     |                                    
sendmsg    | SENDMSG          | netflow              |          | bytesSent     |                                    
recv       | RECVFROM         | netflow              |          | bytesReceived |                                    
recvfrom   | RECVFROM         | netflow              |          | bytesReceived |                                    
recvmsg    | RECVMSG          | netflow              |          | bytesReceived |                                    
ioctl      | FCNTL            | file                 | command  |               |                                    
mount      | MOUNT            |                      |          |               | devname, dirname, type, flags, rc  
shmat      | SHM              | file,memory          |          |               | shmid, shmaddr, shmflg, rc, raddr  
shmget     | SHM              | file                 |          | size          | key, size, shmflg, shmid           
Note
--------
* We provide *uuid*, *type*, *threadId*, *subject*, *timestamp*, and *name* (syscall) of events.
* We do not provide  *predicateObjectPath*, *predicateObject2Path*, *parameters*, and *programPoint*.
* Currently, **pipe** has a bug. We will fix it to provide the information of both ends.
