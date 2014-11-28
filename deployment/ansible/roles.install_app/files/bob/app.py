from flask import Flask, render_template
from werkzeug.contrib.fixers import ProxyFix
app = Flask(__name__)

@app.route('/')
def hello():
    return render_template('index.html')

@app.route('/about')
def about():
    content = "What is this all about? :D"

    return render_template('about.html', content=content)

app.wsgi_app = ProxyFix(app.wsgi_app)

if __name__ == '__main__':
    app.run()
