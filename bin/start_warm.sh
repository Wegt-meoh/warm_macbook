script_dir=$(cd $(dirname $0);pwd)
start_name="start_warm.sh"
stop_name="terminate_warm.sh"
main_name="main.js"

sh "${script_dir}/${stop_name}"

echo "how many task do you want to start:"
read task_num
pm2 start -s "${script_dir}/../src/${main_name}" --name warm_macbook -i $task_num
pm2 list