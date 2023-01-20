code="let t=0\n
while(true){\n
t+=1\n
if(t>10000000000){\n
t=0\n
}\n
}"

terminate_warm.sh


echo "how many task do you want to start:"
read task_num

file=$(mktemp main.XXXX)
echo $code >> $file
pm2 start -s $file --name warm_macbook -i $task_num
pm2 list
rm $file
