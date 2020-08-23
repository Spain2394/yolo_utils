# yolo_utils
Some utilities for working with [darknet](https://github.com/AlexeyAB/darknet) in gacrc clusters

## bbox_predict
These scripts are used to automate utilities for use with darknet
These scripts are found in ```utils```
1. ```auto_predict.bash``` will run prediction on every image ```target.txt```
Usage: ``` auto_predict.bash < target.txt ```. 
2.```make_path_file.bash``` will generate a ```target.txt``` for each image the target folder.
``` rename.bash``` will rename and rescale each image in target folder.
4. ``` auto_read.py ``` will reformat bounding boxes in target.txt and create a txt formatted bounding box for annotating images for YOLO training and place in them ```target_dir```. So each ```<name>.jpg``` will get a ```<name>.txt``` Formatted as follows: ```x_center/image_width y_center/image_height bbox_width/image_width bbox_height/image_height```
5. ```random_selection.bash``` will select ```N``` files from target directory, for setting up randomized validation/tests sets.


## gacrc_utils
1. ```label_info_sub.sh``` auto generates labels and tests images in target folder, can be used for mass prediction for validation or test set.
2. ```mAp_train_plant_sub.sh``` generates mAP, recall, precision, and F1 score for the validation set. Make sure to make to add validation path (```valid = valid.txt```) in your ```./cfg/obj.data``` 
3. ```train_plant_sub-r0_complete.sh``` trains on complete UGA 2015 and UGA 2108 dataset.


## Training info for gacrc
Link to training document: https://wiki.gacrc.uga.edu/wiki/Training
To work between your local device and the remote clusters use the following commmands
```
Login: [ssh] [scp] [-..] MyID@sapelo2.gacrc.uga.edu destination
Transfer: [ssh] [scp] [-..] MyID@xfer.gacrc.uga.edu destination

```
