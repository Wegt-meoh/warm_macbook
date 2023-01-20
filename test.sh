file_name=${0}
file_name=${file_name:2}

file_path=$(readlink -f $file_name)
bin_path=$(dirname $file_path)
echo $bin_path