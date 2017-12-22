Principal
----------

Info           | Provided
---------------|----------
uuid           | V
type           | PRINCIPAL_LOCAL
userId         | V
username       | V
groupIDs       | V
properties     | username, groupname, cred (uid/euid/suid/fsuid/gid/egid/sgid/fsgid)


Subject
----------

Info           | Provided
---------------|----------
uuid           | V
properties     | inode, minor, major, generation, path
type           | PROCESS
cid            | V
parentSubject  | V
localPrincipal | V
startTimeStamp | V
cmdLine        | executable path (arguments are not available for now)
properties     | username, groupname, cred
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
properties     | inode, minor, major, generation, path, version (will be provided)
type           | FILE or NAMED_PIPE
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
memoryAddress  | V
properties     | length, protection (N/A), offset (N/A), validity
epoch          | X
size           | X
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
