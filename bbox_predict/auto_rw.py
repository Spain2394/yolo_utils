#!/usr/local/bin/python3

# Written by Allen Spain
# Data Modified: 04252020
# this script reads all of the txt files from the target dir
# and overwrites these files with the correct bounding box 
# format in the same target directory.

import os
import os.path as osp
import sys
import time
import numpy as np

# path_to_label = "./data/test_labels.txt"
target_dir = "/scratch/avs81684/data/label_predict"

# file_object = open(path_to_label, "r")
class_dict = {"plant":1, "weed":0}
x = None
y = None
w = None
h = None
cl_n = None

# normalized variables
x_n = None
y_n = None
w_n = None
h_n = None
cl_n_n = None

# image dimensions
im_width = 1408
im_height = 1088

bbox = np.array([x,y,w,h,cl_n]).reshape((5,1))
bbox_norm = np.array([x_n,y_n,w_n,h_n,cl_n_n]).reshape((5,1))

def convert_bbox_normalized(bbox):
        """Takes a bounding box in the form [x,y,w,h,cl_n] where x, and y are the top left point of the bounding box
        and w, and height is the width and height of the bounding box. This function return [x_n,y_n,w_n,h_n,cl_n_n]
        where x_n, y_n, w_n, h_n, is normalized by the boxes width and height.
        """
        x_n = (float(bbox[0]) + 1/2 * float(bbox[2]))/im_width
        y_n = (float(bbox[1]) + 1/2 * float(bbox[3]))/im_height
        w_n = float(bbox[2])/im_width
        h_n = float(bbox[3])/im_height
        cl_n_n = float(bbox[4])
        # print(np.array([x_n,y_n,w_n,h_n,cl_n_n]).reshape((5,1)))
        return np.array([x_n,y_n,w_n,h_n,cl_n_n]).reshape((5,1))

def write(bbox,file):
    # file.truncate()
    bbox_n = np.fromstring(bbox.tostring(),dtype=float)
    string_box = str(int(bbox_n[4])) + " " + str(bbox_n[0]) + " " + str(bbox_n[1]) + " " + str(bbox_n[2]) + " " + str(bbox_n[3]) + "\n"
    # print(string_box)
    file.write(string_box)

for filename in os.listdir(target_dir):
    if filename.endswith(".txt"):
        # print(filename)
        curr_file = open(target_dir + "/" + filename,"r+")
        # print(target_dir + "/" + filename)
        data = curr_file.read()
        write_file = open(target_dir + "/" + filename,"w")
        # print(data)
        # print("type= ", type(data))
        spl_file = data.splitlines()
        # for index in range(len(spl_file)):
        # print(len(spl_file))
        #lines # plant: 74%      (left_x:  696   top_y:  400   width:   87   height:   84)
        for lines in spl_file:
            words = lines.split()
            if len(words) != 0:
                if words[0] == "plant:":
                    # print("iterating through word")
                    # print(words[0])
                    for i in range(len(words)):
                        if words[i] == "plant:" or words[i] == "weeds:":
                            cl_n = class_dict[words[i].replace(':',"")]
                            # print(class_dict[words[i].replace(':',"")])
                        elif words[i] == "(left_x:":
                            x = words[i+1]
                            # print(words[i+1])
                        elif words[i] == "top_y:":
                            y = words[i+1]
                            # print(words[i+1])
                        elif words[i] == "width:":
                            w = words[i+1]
                            # print(words[i+1])
                        elif words[i] == "height:":
                            h = words[i+1].replace(')','')
                            # print(words[i+1].replace(')',''))
                    bbox = np.array([x,y,w,h,cl_n]).reshape((5,1))
                    # bbox = np.append(np.array([x,y,w,h,cl_n]).reshape((5,1)))
                    print("bounding box")
                    print(bbox)
                    print("boundin box norm")
                    bbox_norm = convert_bbox_normalized(bbox)
                    print(bbox_norm)
                    # write a single line
                    write(bbox_norm, write_file)
                # close file
        write_file.close()
        curr_file.close()
