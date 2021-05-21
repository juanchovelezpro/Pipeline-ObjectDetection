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
cp /home/bragapo23/Pipeline-ObjectDetection/files/generate_tfrecord.py .
cd /home/bragapo23/TensorFlow/workspace
mkdir training_demo
cd training_demo
cp /home/bragapo23/Pipeline-ObjectDetection/files/exporter_main_v2.py .
cp /home/bragapo23/Pipeline-ObjectDetection/files/model_main_tf2.py .
mkdir annotations
mkdir exported-models
mkdir images
mkdir models
mkdir pre-trained-models
cd annotations
cp /home/bragapo23/Pipeline-ObjectDetection/files/label_map.pbtxt .
echo "Downloading train.record"
export PATH='/home/juanchovelezpro/.local/bin'
gdown https://drive.google.com/uc?id=1Kl4dv4tg4ppFYfZebuo9WkHpSngkAXYa
echo "Downloading test.record"
gdown https://drive.google.com/uc?id=1Kn9Xbeurba9a5iBt0l8GsCrHwn5hFLE_