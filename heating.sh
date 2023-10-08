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

printf "warming..."

read -s -n1 -p "press any key to terminate..."

for pid in ${pid_list[@]}; do
    kill $pid
done

printf "finish"
