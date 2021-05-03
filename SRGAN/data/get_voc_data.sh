#!/bin/bash
echo "hi"
wget http://host.robots.ox.ac.uk/pascal/VOC/voc2012/VOCtrainval_11-May-2012.tar
tar -xvf VOCtrainval_11-May-2012.tar
mkdir voc_train
mkdir voc_val
cd VOCdevkit/VOC2012/JPEGImages/
ls | shuf -n 425 | xargs -i mv {} ../../../voc_val
ls | xargs -i mv {} ../../../voc_train
cd ../../../
rm -rf VOCdevkit/
