BINS=mmap				\
	 netrecon			\
	 sock_server_1		\
	 sock_server_2		\
	 sock_server_3		\
	 sock_client		\
	 cross_file_1		\
	 cross_file_2		\
	 shm_client			\
	 shm_server			\

TXT=sample_in.txt		\
	cross_file_txt		\

SH=server.sh		\


all: ${BINS} ${TXT} ${SH}

mmap: simp-read-mmap.c
	cc simp-read-mmap.c -o mmap
netrecon: netrecon.c
	cc netrecon.c -o netrecon

sock_server_1: sock_server_1.c
	cc sock_server_1.c -o sock_server_1

sock_server_2: sock_server_2.c
	cc sock_server_2.c -o sock_server_2

sock_server_3: sock_server_3.c
	cc sock_server_3.c -o sock_server_3

sock_client: sock_client.c
	cc sock_client.c -o sock_client

cross_file_1: cross_file_1.c
	cc cross_file_1.c -o cross_file_1

cross_file_2: cross_file_2.c
	cc cross_file_2.c -o cross_file_2

shm_client: shm_client.c
	cc shm_client.c -o shm_client

shm_server: shm_server.c
	cc shm_server.c -o shm_server

sample_in.txt:
	echo "hello jacket!" > 'sample_in.txt'

cross_file_txt:
	touch aa.txt bb.txt cc.txt dd.txt ee.txt ff.txt gg.txt hh.txt ii.txt

server.sh:
	echo "./sock_server_1&" > 'server.sh'
	echo "./sock_server_2&" >> 'server.sh'
	echo "./sock_server_3&" >> 'server.sh'
	chmod +x 'server.sh'


clean:
	rm -f *~ .*~ ${BINS} index.html *.txt
