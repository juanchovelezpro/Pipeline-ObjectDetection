path=$(pwd)
linkPreTrainedModel=http://download.tensorflow.org/models/object_detection/tf2/20200711/ssd_resnet50_v1_fpn_640x640_coco17_tpu-8.tar.gz
tarPreTrainedModel=ssd_resnet50_v1_fpn_640x640_coco17_tpu-8.tar.gz
nameCustomModel=my_ssd_resnet50_v1_fpn

echo "Installing wget"
sudo apt install wget -y

echo "Building pipeline in folder -> $path/TensorFlow" 
cd $path/TensorFlow/workspace/training_demo/pre-trained-model
echo "Downloading pre-trained-model"
wget $linkPreTrainedModel
tar -xf $tarPreTrainedModel
rm $tarPreTrainedModel
cd ..
cd models
echo "Creating folder for custom model"
mkdir $nameCustomModel
cd $nameCustomModel
echo "Copying custom pipeline.config for training"
cp $path/Pipeline-ObjectDetection/files/pipeline.config .
cd $path/TensorFlow

echo "Cloning TensorFlow Models into TensorFlow folder"
git clone https://github.com/tensorflow/models.git
cd models
echo "Checkout to older version for compatibility (20 sept 2020)"
git checkout -f c3d53565f3b5964e7ab46cb9a23689ceacc8823a

echo "Installing some libraries and tools..."
sudo apt-get install protobuf-compiler python-lxml python-pil
pip3 install Cython pandas tf-slim lvis

echo "Compiling protobuf libraries"
cd $path/TensorFlow/models/research/
protoc object_detection/protos/*.proto --python_out=.

echo "Installing Object Detection API"
cp object_detection/packages/tf2/setup.py .
python3 -m pip install .

echo "Test Object Detection API"
python3 object_detection/builders/model_builder_tf2_test.py
