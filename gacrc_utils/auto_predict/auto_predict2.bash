#!/bin/bash

while read line; do 
    # echo $(dirname "$line")
    # echo $(basename "$line" .jpg).txt
    # echo hello >> $(dirname "$line")"/"$(basename "$line" .jpg).txt
    echo "file path: $line"
    echo "writting to $(dirname "$line")"/"$(basename "$line" .jpg).txt"
    time ./darknet detector test ./cfg/plant-weed-obj.data ./cfg/plant-weed-yolov3-tiny-r0.cfg ./traint-weed-yolov3-tiny-r0_final.weights $line -dont_show -ext_output >> $(dirname "$line")"/"$(basename "$line" .jpg).txt
done

