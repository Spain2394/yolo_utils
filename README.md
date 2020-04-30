#yolo_utils
Some utilities for working with darknet

## Utilities for working gacrc clusters
1. ```label_info_sub.sh``` auto generates labels and tests images in target folder, can be used for mass prediction for validation or test set.
2. ```mAp_train_plant_sub.sh``` generates mAP, recall, precision, and F1 score for the validation set. Make sure to make to add validation path (```valid = valid.txt```) in your ```./cfg/obj.data``` 
3. ```train_plant_sub-r0_complete.sh``` trains on complete dataset as of (04202020)


## Training info for gacrc
Link to training document: https://wiki.gacrc.uga.edu/images/5/5f/GACRC_Sapelo2_cluster_new_user_training_workshop_v7.pdf
To work between your local device and the remote clusters use the following commmands
```
Login: [ssh] [scp] [-..] MyID@sapelo2.gacrc.uga.edu destination
Transfer: [ssh] [scp] [-..] MyID@xfer.gacrc.uga.edu destination

```
