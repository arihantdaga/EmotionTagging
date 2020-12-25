from flask import Flask
from flask import request
app = Flask(__name__)

from emotion import get_emotion

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/get_emotion', methods=['POST'])
def get_emotion_of_text():
    if request.method == 'POST':
        text = request.json.get('text')
        return get_emotion(text)


if __name__ == "__main__": 
    app.run(host ='0.0.0.0', port = 5001, debug = True)  