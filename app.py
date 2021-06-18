from flask import Flask, request, jsonify
import numpy as np
import tensorflow as tf
from PIL import Image
import warnings

warnings.filterwarnings('ignore')

print("Loading Model...")
model = tf.saved_model.load("./model/saved_model")

app = Flask(__name__)
app.config["DEBUG"] = True

@app.route('/', methods=['GET'])
def home():
    return "<h1>Object Detection API for OCR</h1>"

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
    return jsonify({"scores":scores,"boxes":boxes,"classes":classes}), 200

app.run(host='0.0.0.0')