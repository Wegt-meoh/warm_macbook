#!/usr/bin/env bash
printf "how many threads do you want? "
read thread_nums

pid_list=()

for ((index = 0; index < $thread_nums; index += 1)); do
    while :; do
        a=1
        let a++
        let a--
    done &
    pid_list[$index]=$!
done

terminate_program() {
    for pid in ${pid_list[@]}; do
        kill $pid &>/dev/null
    done

    echo "finish"
    exit 0
}

trap terminate_program INT

printf "ctrl + c to terminate\n"

frames="/ - | \\"
while kill -0 $$ &>/dev/null; do
    for f in $frames; do
        printf "heating %s" $f
        sleep 0.4
        printf "\r"
    done
done
