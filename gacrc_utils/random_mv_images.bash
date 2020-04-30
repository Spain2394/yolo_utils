#!/bin/bash
PATH="/Volumes/HSKY-BCKUP/YOLO/UGA\ 2018/train"

for filename in "/Volumes/HSKY-BCKUP/YOLO/UGA\ 2018/train"/*.jpg; do
        # echo python3 predict.py -i $filename -o "./tests_transformed/_test$i.jpg" --model $MODEL
        echo  $(basename "$filename" .jpg).jpg
	# time python3 ./predict.py -i $filename -o ./tests_e30/output_$(basename "$filename" .jpg).jpg --model ./checkpoints/CP_epoch\{epoch\ +\ 1\}.pth 
        # convert -resize 1567X361 ./tests_transformed/test$i.jpg ./tests_transformed/test$i.jpg
done