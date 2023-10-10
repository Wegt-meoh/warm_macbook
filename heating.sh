#!/usr/bin/env bash
terminate_program() {
    echo $time_count
    for pid in ${pid_list[@]}; do
        kill $pid &>/dev/null
    done

    if [ $time_count -le 60 ]; then
        printf "\ntake %s seconds" $time_count
    elif [ $time_count -le 3600 ]; then
        printf "\ntake %s minutes and %s seconds" $(($time_count / 60)) $(($time_count % 60))
    else
        printf "\ntake %s hours and %s minutes and %s seconds" $(($time_count / 3600)) $(($time_count % 3600 / 60)) $(($time_count % 60))
    fi
    printf "\n"

    exit 0
}

animation() {
    frames="/ - | \\"
    count=0
    while kill -0 $$ &>/dev/null; do
        for f in $frames; do
            let count++
            printf "heating %s" $f
            sleep 0.5
            printf "\r"
            if [ $((count % 2)) -eq 0 ]; then
                let count=0
                let time_count++
            fi
        done
    done
}

# main
printf "how many threads do you want? "
read thread_nums

pid_list=()
time_count=0

for ((index = 0; index < $thread_nums; index += 1)); do
    while :; do
        a=1
        let a++
        let a--
    done &
    pid_list+=($!)
done

trap terminate_program INT

printf "pid: %s\n" $$
printf "ctrl + c to terminate\n"

animation
