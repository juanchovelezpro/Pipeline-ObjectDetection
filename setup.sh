path=$(pwd)
trainRecord=https://drive.google.com/uc?id=1Kl4dv4tg4ppFYfZebuo9WkHpSngkAXYa
valRecord=https://drive.google.com/uc?id=1Kn9Xbeurba9a5iBt0l8GsCrHwn5hFLE_

echo "Setup pipeline in folder -> $path/TensorFlow"

echo "Installing gdown"
pip3 install gdown

echo "Creating folders and files"
mkdir TensorFlow
cd TensorFlow
mkdir scripts
mkdir workspace
cd scripts
mkdir preprocessing
cd preprocessing
cp $path/Pipeline-ObjectDetection/files/generate_tfrecord.py .
cd $path/TensorFlow/workspace
mkdir training_demo
cd training_demo
cp $path/Pipeline-ObjectDetection/files/exporter_main_v2.py .
cp $path/Pipeline-ObjectDetection/files/model_main_tf2.py .
mkdir annotations
mkdir exported-models
mkdir images
mkdir models
mkdir pre-trained-model
cd annotations
echo "Copying custom label map"
cp $path/Pipeline-ObjectDetection/files/label_map.pbtxt .
echo "Downloading train.record"
export PATH=$path/.local/bin
gdown $trainRecord
echo "Downloading test.record"
gdown $valRecord