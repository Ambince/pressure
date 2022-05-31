#!/bin/bash

page_array[0]=https://demo.dagen.life/
page_array[1]=https://demo.dagen.life/gens
page_array[2]=https://demo.dagen.life/igo
page_array[3]=https://demo.dagen.life/game
page_array[4]=https://pancakeswap.finance/info

c=$1
n=$2
output_name="dagen-market.txt"

if [ ! -n "$n" ]; then
   n=1
else
   echo “每个线程执行”$n"次"
fi



if [ ! -n "$c" ]; then
    rate=1000
    rm -rf dagen-market.txt
else
    rm -rf dagen-market-$c.txt
    output_name=dagen-market-$c.txt
    echo “共有”$c“个线程执行”
fi


for var in ${page_array[@]};
do

./go-stress-testing-linux -c $c  -n $n -u $var 2>&1 |tee -a $output_name
done



