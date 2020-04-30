#!/bin/bash
# PATH="102"
COUNT=0
for filename in ./Images/*.jpg; do
    mogrify -resize 1408X1088! $filename
    mv $filename $(dirname "$filename")/$(basename "$filename" .jpg).jpg;
    echo renamed $filename $(dirname "$filename")/$(basename "$filename" .jpg).jpg;
    # echo $(basename "$filename" .jpg)_102;
    # counter=$(counter + 1);
    ((COUNT++))
done
echo $COUNT
cp -r ./Images/* /Volumes/HSKY-BCKUP/YOLO/UGA\ 2018/train




# for filename in ./102/*.jpg; do
# 	# time mv $filename ./$PATH/$(basename "$filename" .jpg)_$PATH.jpg
#     echo $filename changed to $(basename "$filename" .jpg)_102.jpg
#     counter = $((counter + 1))
# done

# echo $counter
