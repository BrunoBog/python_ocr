import pytesseract as ocr
from flask import Flask, request, jsonify
from PIL import Image

app = Flask(__name__)

def get_text_from_image(img):
    phase =  ocr.image_to_string(img, lang='por')
    return phase

@app.route('/api/ocr', methods=['POST'])
def post_image():
    file = request.files['file']
    img = Image.open(file.stream)
    text = get_text_from_image(img)
    return jsonify({"text": text})


if __name__ == '__main__':
    app.run(debug=False, host="0.0.0.0", port=5060)