BINS=listdir 						\
	copy_file 						\
	copy_static_buf 				\
	copy_static_buf_string			\
	copy_static_heap_buf 			\
	copy_static_buf_stack_frame		\
	download_with_wget				\
	fork_process					\
	make_directory					\
	change_file_permissions			\
	remove_directory				\
	remove_file

all: ${BINS}

listdir: listdir.c
	cc listdir.c -o listdir

copy_file: copy_file.c
	cc copy_file.c -o copy_file

copy_static_buf: copy_static_buf.c
	cc copy_static_buf.c -o copy_static_buf

copy_static_buf_string: copy_static_buf_string.c
	cc copy_static_buf_string.c -o copy_static_buf_string

copy_static_heap_buf: copy_static_heap_buf.c
	cc copy_static_heap_buf.c -o copy_static_heap_buf

copy_static_buf_stack_frame: copy_static_buf_stack_frame.c
	cc copy_static_buf_stack_frame.c -o copy_static_buf_stack_frame

download_with_wget: download_with_wget.c
	cc download_with_wget.c -o download_with_wget

fork_process: fork_process.c
	cc fork_process.c -o fork_process

make_directory: make_directory.c
	cc make_directory.c -o make_directory

remove_directory: remove_directory.c
	cc remove_directory.c -o remove_directory

change_file_permissions: change_file_permissions.c
	cc change_file_permissions.c -o change_file_permissions

remove_file: remove_file.c
	cc remove_file.c -o remove_file

clean:
	rm -f *~ .*~ ${BINS} index.html
