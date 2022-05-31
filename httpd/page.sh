#!/bin/bash

page_array[0]=https://demo.dagen.life/
page_array[1]=https://demo.dagen.life/gens
page_array[2]=https://demo.dagen.life/igo
page_array[3]=https://demo.dagen.life/game
page_array[4]=https://pancakeswap.finance/info


n=$1
c=$2
output_name="dagen-market.txt"

if [ ! -n "$n" ]; then
   n=1000
else
   echo “一共执行”$n次
fi



if [ ! -n "$c" ]; then
    c=1000
    rm -rf dagen-market.txt
else
    rm -rf dagen-market-$c.txt
    output_name=dagen-market-$c.txt
    echo “共有”$c“个线程执行”
fi




for var in ${page_array[@]};
do
	ab -n $n -c $c  $var  >> $output_name	

done





for var in ${page_array[@]};
do
        ab -n 1000 -c 1000  $var  >> dagen-market.txt

done


