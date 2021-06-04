from flask import Flask, request, Response, jsonify, send_from_directory, abort
from absl import app, logging
import os
import numpy as np
import json
import tensorflow as tf
from object_detection.utils import label_map_util
from object_detection.utils import visualization_utils as viz_utils
from PIL import Image
import warnings
warnings.filterwarnings('ignore')

print("Loading Model...")
model = tf.saved_model.load("./my_model/saved_model")

app = Flask(__name__)
app.config["DEBUG"] = True

@app.route('/', methods=['GET'])
def home():
    return "<p>Object Detection API for OCR</p>"

@app.route('/health', methods=['GET'])
def health():
    return tf.version.VERSION

@app.route('/detect', methods=['POST'])
def detect():
    image = request.files['image']
    image_np = np.array(Image.open(image))
    input_tensor = tf.convert_to_tensor(image_np)
    input_tensor = input_tensor[tf.newaxis, ...]
    detections = model(input_tensor)
    scores = detections['detection_scores'].numpy().tolist()
    classes = detections['detection_classes'].numpy().tolist()
    boxes = detections['detection_boxes'].numpy().tolist()
    return jsonify({"successful":"test","scores":scores,"boxes":boxes,"classes":classes}), 200
    
app.run(host="0.0.0.0")