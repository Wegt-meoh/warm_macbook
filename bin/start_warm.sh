terminate_warm.sh

echo "how many task do you want to start:"
read task_num
pm2 start -s main.js --name warm_macbook -i $task_num
pm2 list
