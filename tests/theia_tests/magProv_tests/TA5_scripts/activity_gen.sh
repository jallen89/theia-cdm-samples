#!/bin/bash -x

function run_one_command {
	local cmd="$1"

	echo "running ${cmd}"
	${cmd}
}

COMMAND_FILE="./commands.txt"

echo "Reading commands from ${COMMAND_FILE}"
cat ${COMMAND_FILE} | while read line; do
	bash -c "${line}"
	sleep 5
done
