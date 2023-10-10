#!/usr/bin/env bash
terminate_program() {
    take=$(($(date +%s) - $start))

    for pid in ${pid_list[@]}; do
        kill $pid &>/dev/null
    done

    if [ $take -le 60 ]; then
        printf "\ntake %s seconds" $take
    elif [ $take -le 3600 ]; then
        printf "\ntake %s minutes and %s seconds" $(($take / 60)) $(($take % 60))
    else
        printf "\ntake %s hours and %s minutes and %s seconds" $(($take / 3600)) $(($take % 3600 / 60)) $(($take % 60))
    fi
    printf "\n"

    exit 0
}

animation() {
    frames="/ - | \\"
    while kill -0 $$ &>/dev/null; do
        for f in $frames; do
            printf "heating %s" $f
            sleep 0.4
            printf "\r"
        done
    done
}

# main
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

trap terminate_program INT

start=$(date +%s)

printf "pid: %s\n" $$
printf "ctrl + c to terminate\n"

animation
