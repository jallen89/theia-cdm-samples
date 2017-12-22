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
