#!/bin/bash/

## test set
for filename in $(find ./train_2015/*.jpg -type f | shuf -n 100); do
    echo $filename
    mv $filename ./valid_2015/$(basename $filename .jpg).jpg
done

## validation set
# for filename in $(find ./train -type f | shuf -n 478); do
#     echo $filename
#     mv $filename ./valid/$(basename $filename .jpg).jpg
# done
