#PBS -S /bin/bash
#PBS -N label_auto_test
#PBS -q patterli_q
#PBS -l nodes=1:ppn=16:gpus=1:default
#PBS -l walltime=48:00:00
#PBS -l mem=60gb
#PBS -M avs81684@uga.edu 
#PBS -m abe

cd /scratch/avs81684/darknet

# configure path to opencv
# pkg-config --libs opencv
# pkg-config --libs opencv4
# export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/apps/eb/OpenCV/3.4.7-fosscuda-2018b-Python-3.6.6/lib64/pkgconfig

# Cmake
# CUDA 10
# cudNN > 7 for CUDA 10
# OpenCV >= 2.4 compiled with cuda 

# module load CMake/3.15.3-GCCcore-8.3.0
# module load CUDA/10.1.243
# cudNN > 7.0 with CUDA 10.0 
# module load cuDNN/7.6.4.38-gcccuda-2019b
# not working as is
# module load OpenCV/3.4.1-foss-2016b-Python-2.7.14
# module load opencv/3.0/gcc447_cuda65

# fosscuda-2018b module loads CUDA 9
# This may not work due to CUDA < 10
module load CMake/3.15.3-GCCcore-7.3.0
module load cuDNN/7.1.4-fosscuda-2018b
module load OpenCV/3.4.7-fosscuda-2018b-Python-3.6.6

echo "Job ID: $PBS_JOBID"
echo "Queue:  $PBS_QUEUE"
echo "Cores:  $PBS_NP"
echo "Nodes:  $(cat $PBS_NODEFILE | sort -u | tr '\n' ' ')"

# make
#./darknet detector test ./cfg/coco.data ./cfg/yolov3-tiny.cfg yolov3-tiny.weights data/dog.jpg -dont_show > ./logs/output_${PBS_JOBID}.log
# ./darknet detector test ./cfg/plant-weed-obj.data ./cfg/plant-weed-yolov3-tiny-r0.cfg ./train_382_r0/plant-weed-yolov3-tiny-r0_final.weights ./data/obj/101.jpg -dont_show -ext_output < da# ta/plant-weed-test.txt > result.txt 
# RUN PREDICTION ON EVERY IMAGE IN FILE < INPUT.TXT
bash predict_save.bash < ./data/test_1518_complete.txt 

