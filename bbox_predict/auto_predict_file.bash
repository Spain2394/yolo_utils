#!/bin/bash

# this script writes the output of the image prediction output
# and saves it to a txt file in the image directory. 

PATH = "../"

# while read line; do 
for filename in ./data/label_predict; do
    # echo $(dirname "$line")
    # echo $(basename "$line" .jpg).txt
    # echo hello >> $(dirname "$line")"/"$(basename "$line" .jpg).txt
    echo "file path: $filename"
    echo "writting to $(dirname "$filename")"/"$(basename "$filename" .jpg).txt"
    time ./darknet detector test ./cfg/plant-weed-obj.data ./cfg/plant-weed-yolov3-tiny-r0.cfg ./traint-weed-yolov3-tiny-r0_final.weights $line -dont_show -ext_output >> $(dirname "$filename")"/"$(basename "$filename" .jpg).txt
done

