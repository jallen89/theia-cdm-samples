
all:
	gcc -O3 screengrab.c -o screengrab -lpng -lm -lX11
	gcc -o implant implant-core.c
	gcc -o implant-1 implant-core-1.c
	gcc -o implant-send implant-send.c
	gcc -o sock_server sock_server.c

clean:
	rm screengrab implant implant-1 implant-send sock_server
