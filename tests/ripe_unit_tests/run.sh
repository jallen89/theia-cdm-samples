#!/bin/sh

./listdir
./change_file_permissions
./copy_file
./remove_file
echo "copied and removed file"
./copy_static_buf
./copy_static_buf_string
./copy_static_heap_buf
./copy_static_buf_stack_frame
echo "did all the copy buf"
./download_with_wget
echo "downloaded file"
./fork_process
echo "did the fork"
./make_directory
./remove_directory
echo "did create and remove dir"
