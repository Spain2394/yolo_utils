#!/bin/bash

# old usage bash auto_predict.bash < predict_target.txt
search_path = ./data/test_video_frames
for line in $(ls $search_path); do
    if [[ -d $line ]]; then 
        echo "$line is a Dir"
        for filename in "$search_path/$line/*.png"; do 
            echo "$search_path/$(basename "$filename" .png).txt"
            # time ./darknet detector test ./cfg/plant-weed-obj.data ./cfg/plant-weed-yolov3-tiny-r0-med.cfg ./evaluation/test_2015_med_r0/plant-weed-yolov3-tiny-r0-med_best.weights $filename -dont_show -ext_output >> "./data/test_video_frames/$filename/$(basename "$filename" .png).txt
    elif [[ -f $line ]]; then 
        echo "$not a directory" 
    else 
        echo "Invalid path" 
    fi
done
    # make a prediction and store annotated image
    # cp ./predictions.jpg $line

