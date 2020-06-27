#!/bin/bash

jeem=()
for (( c=1; c<=2; c++ ))
do
    jeem+=('s/ح/ج/g')
done
for (( c=1; c<=3; c++ ))
do
    jeem+=('s/ح/خ/g')
done
for (( c=1; c<=4; c++ ))
do
    jeem+=('s/ح/ح/g')
done

taa=()
taa+=('s/ٮ/ث/g')
for (( c=1; c<=2; c++ ))
do
    taa+=('s/ٮ/ب/g')
done
for (( c=1; c<=4; c++ ))
do
    taa+=('s/ٮ/ت/g')
done

haa=()
for (( c=1; c<=4; c++ ))
do
    haa+=('s/ه/ه/g')
done
for (( c=1; c<=3; c++ ))
do
    haa+=('s/ه/ة/g')
done

gheen=()
gheen+=('s/ع/غ/g')
for (( c=1; c<=7; c++ ))
do
    gheen+=('s/ع/ع/g')
done

raa=()
raa+=('s/ر/ز/g')
for (( c=1; c<=5; c++ ))
do
    raa+=('s/ر/ر/g')
done

daal=()
daal+=('s/د/ذ/g')
for (( c=1; c<=11; c++ ))
do
    daal+=('s/د/د/g')
done

zaa=()
zaa+=('s/ط/ظ/g')
for (( c=1; c<=7; c++ ))
do
    zaa+=('s/ط/ط/g')
done

seen=()
seen+=('s/س/س/g')
seen+=('s/س/ش/g')

saad=()
for (( c=1; c<=2; c++ ))
do
    saad+=('s/ص/ض/g')
done
for (( c=1; c<=3; c++ ))
do
    saad+=('s/ص/ص/g')
done

strInputVlaue=$(<"$1")
echo $strInputVlaue
strInputSemiColun=${strInputVlaue// /;}

line=""
echo $line > $2
aryOutput=()
while read -n 1 newChar
do 
    size=${#raa[@]}
    index=$(($RANDOM % $size))
    raaString=${raa[$index]}

    size=${#seen[@]}
    index=$(($RANDOM % $size))
    seenString=${seen[$index]}

    size=${#daal[@]}
    index=$(($RANDOM % $size))
    daalString=${daal[$index]}

    size=${#zaa[@]}
    index=$(($RANDOM % $size))
    zaaString=${zaa[$index]}

    size=${#jeem[@]}
    index=$(($RANDOM % $size))
    jeemString=${jeem[$index]}

    size=${#taa[@]}
    index=$(($RANDOM % $size))
    taaString=${taa[$index]}

    size=${#gheen[@]}
    index=$(($RANDOM % $size))
    gheenString=${gheen[$index]}

    size=${#saad[@]}
    index=$(($RANDOM % $size))
    saadString=${saad[$index]}    
       
    size=${#haa[@]}
    index=$(($RANDOM % $size))
    haaString=${haa[$index]} 
      
    aryOutput+=$(echo -n $newChar | sed "${raaString}; ${seenString}; ${daalString}; ${zaaString}; ${saadString}; ${gheenString}; ${haaString}; ${taaString}; ${jeemString}; s/ڡ/ف/g; s/ٯ/ق/g; s/ں/ن/g; s/ى/ي/g")
         
done <<< $strInputSemiColun

strKAKA=$aryOutput
strWithSemiColun=${strKAKA//[[:blank:]]/}

echo $strWithSemiColun | sed 's/;/ /g' > $2
