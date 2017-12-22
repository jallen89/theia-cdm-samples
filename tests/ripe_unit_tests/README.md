This package contains tools to extract callgraphs from program
binaries and generate visual images from these graphs.

Included in this package are two simple binaries that exemplify simple
OS-level behavior. Valgrind can be used to generate the callgraph
information and gprof2dot.py can then be used to draw this graph as an
image.

See the run.sh file for the order of operations.

These tools are meant to help us bootstrap some methods to analyze
data provenance graphs and also give us a sense of the scale of the
problem.

---------------------
Test coverage 

[x] copy between static variables in main
[x] copy between static variable and dynamic variable in main
[x] copy between static variables in function called by main
[x] copy by pointer between static variables in main
[x] copy by pointer between static variables in function called by main
[x] list files in directory
[x] read file from disk to buffer
[x] read file to disk from to buffer, write to disk
[x] delete a file 
[x] download file from internet
[x] fork a child process
[x] change permissions of a file

[] Compile program with specific static library
[] Merge files into single file
[] Open a port to listen (Netcat)
[] Send HTTP request
 