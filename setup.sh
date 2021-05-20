echo "Installing gdown"
pip3 install gdown

echo "Creating folders and files"
mkdir TensorFlow
cd TensorFlow
mkdir scripts
mkdir workspace
cd scripts
mkdir preprocessing
cd ..
cd workspace
mkdir training_demo
cd training_demo
mkdir annotations
mkdir exported-models
mkdir images
mkdir models
mkdir pre-trained-models
cp /home/bragapo23/Pipeline-ObjectDetection/files/exporter_main_v2.py .
cp /home/bragapo23/Pipeline-ObjectDetection/files/model_main_tf2.py .
cd annotations
cp /home/bragapo23/Pipeline-ObjectDetection/files/label_map.pbtxt .
echo "Downloading train.record"
gdown https://drive.google.com/uc?id=1Kl4dv4tg4ppFYfZebuo9WkHpSngkAXYa
echo "Downloading test.record"
gdown https://drive.google.com/uc?id=1Kn9Xbeurba9a5iBt0l8GsCrHwn5hFLE_
cd ..
cd pre-trained-models
wget http://download.tensorflow.org/models/object_detection/tf2/20200711/ssd_resnet50_v1_fpn_640x640_coco17_tpu-8.tar.gz
cd ..
cd ..

# echo "Cloning TensorFlow Models into TensorFlow folder"
# git clone https://github.com/tensorflow/models.git
# cd models
# echo "Checkout to older version for compatibility (20 sept 2020)"
# git checkout -f c3d53565f3b5964e7ab46cb9a23689ceacc8823a

# echo "Installing some libraries and tools..."
# apt-get install protobuf-compiler python-lxml python-pil
# pip install Cython pandas tf-slim lvis

# echo "Compiling protobuf libraries"
# cd /TensorFlow/models/research/
# protoc object_detection/protos/*.proto --python_out=.
