#!/bin/bash

api_array[0]=https://demo.dagen.io/api/querySetting
api_array[1]=https://demo.dagen.io/api/attributeStatistics?on_sale=true
api_array[2]=https://demo.dagen.io/api/genOwners?chainId=4&tokenId=1
api_array[3]="https://demo.dagen.io/api/getAttributesRarity?attributes[]=%7B%22trait_type%22:%22Nickname%22,%22value%22:%22Cinnabar+Devourer%22%7D&attributes[]=%7B%22trait_type%22:%22Divinity%22,%22value%22:%221%22%7D&attributes[]=%7B%22trait_type%22:%22Function%22,%22value%22:%22Convert%22%7D&attributes[]=%7B%22trait_type%22:%22Input%22,%22value%22:%22Light%22%7D&attributes[]=%7B%22trait_type%22:%22Spectrum%22,%22value%22:%22Red%22%7D&attributes[]=%7B%22trait_type%22:%22Output%22,%22value%22:%22Energy%22%7D&attributes[]=%7B%22trait_type%22:%22Type%22,%22value%22:%22C%22%7D&attributes[]=%7B%22trait_type%22:%22Variant%22,%22value%22:%221%22%7D"
api_array[4]=https://demo.dagen.io/api/profile?walletAddress=0x37d8b0123d013ad824b14d8e6a946da425b551cd
api_array[5]=https://demo.dagen.io/gens/00000000000000000000000000000000000000000000000000000000000000001.json
api_array[6]=https://demo.dagen.io/api/genOwners?chainId=4&tokenId=1
api_array[7]=https://demo.dagen.io/api/queryBlindBox?page=0&onSale=false
api_array[8]=https://demo.dagen.io/api/verifyForBlindBox


c=$1
n=$2
output_name="dagen-api.txt"

if [ ! -n "$n" ]; then
   n=1
else
   echo “每个线程执行”$n"次"
fi



if [ ! -n "$c" ]; then
    c=1000
    rm -rf dagen-api.txt
else
    rm -rf dagen-api$c.txt
    output_name=dagen-api-$c.txt
    echo 共有$c个线程执行
fi


for var in ${api_array[@]};
do

./go-stress-testing-linux -c $c  -n $n -u $var 2>&1 |tee -a $output_name
done

