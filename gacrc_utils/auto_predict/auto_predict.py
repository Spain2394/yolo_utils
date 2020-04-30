import os
import os.path as osp
import sys
import time
import numpy as np


path_to_label = "./data/test_labels.txt"
storage_folder = "./data/obj/test_folder"

file_object = open(path_to_label, "r") 

## create files for each of these things. 
for line in file_object: 
    # read file and get the path
    print
    # os.sys(./darknet detector test ./cfg/plant-weed-obj.data ./cfg/plant-weed-yolov3-tiny-r0.cfg ./traint-weed-yolov3-tiny-r0_final.weights ./data/obj/101.jpg -dont_show -ext_output >> "predicted_boxes/./$(basename "$filename" .jpg)_test$i.txt"
    # base_name = osp.splitext(line)[0]
    # # if osp.exists(base_name):
    # print(base_name)
    # f = open(base_name + ".txt","a+")
    # f.write("something heree..")
    # f.close()

            


    # if not osp.exists()

    # f= open(dat,"w+")
    # f.write("Hello World")
    # f.close()


# print(file_object.read())
# print(type(file_object.read()))

