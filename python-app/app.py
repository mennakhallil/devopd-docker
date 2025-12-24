
from flask import Flask



app = Flask(__name__)

@app.route('/health')
def health():
    return {'status': 'healthy'}, 200



@app.route('/')

def home():

    return '<h1>Welcome!</h1><p>My website is live!</p><a href="/about">About</a>'



@app.route('/about')

def about():

    return '<h1>About Me</h1><p>I am a web developer.</p><a href="/">Home</a>'



@app.route('/contact')

def contact():

    return '<h1>Contact</h1><p>Email: me@example.com</p><a href="/">Home</a>'



@app.route('/blog')

def blog():

    return '<h1>Blog</h1><p>Post 1: Learning Flask</p><p>Post 2: Python Tips</p><a href="/">Home</a>'



if __name__ == '__main__':

    app.run(debug=True, host='0.0.0.0', port=5000)

