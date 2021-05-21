cd /home/bragapo23/TensorFlow/workspace/training_demo/pre-trained-model
echo "Downloading pre-trained-model"
wget http://download.tensorflow.org/models/object_detection/tf2/20200711/ssd_resnet50_v1_fpn_640x640_coco17_tpu-8.tar.gz
tar -xf ssd_resnet50_v1_fpn_640x640_coco17_tpu-8.tar.gz
rm ssd_resnet50_v1_fpn_640x640_coco17_tpu-8.tar.gz
cd ..
cd models
mkdir my_ssd_resnet50_v1_fpn
cd my_ssd_resnet50_v1_fpn
cp /home/bragapo23/Pipeline-ObjectDetection/files/pipeline.config .
cd /home/bragapo23/TensorFlow

echo "Cloning TensorFlow Models into TensorFlow folder"
git clone https://github.com/tensorflow/models.git
cd models
echo "Checkout to older version for compatibility (20 sept 2020)"
git checkout -f c3d53565f3b5964e7ab46cb9a23689ceacc8823a

echo "Installing some libraries and tools..."
sudo apt-get install protobuf-compiler python-lxml python-pil
pip3 install Cython pandas tf-slim lvis

echo "Compiling protobuf libraries"
cd /home/bragapo23/TensorFlow/models/research/
protoc object_detection/protos/*.proto --python_out=.