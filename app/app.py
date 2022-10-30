from flask import Flask, render_template
from apscheduler.schedulers.background import BackgroundScheduler
import get_aws_resources

get_aws_resources.get_aws_resources()

app = Flask(__name__)

f = open('my_aws_resources.txt','r')
g = f.read()
g = g.replace('\n', '<br>')

@app.route('/')
def index():
    return render_template('index.html',n=g)

@app.route('/page2')
def page2():
    return render_template('page2.html')

scheduler = BackgroundScheduler()
scheduler.add_job(func=get_aws_resources.get_aws_resources, trigger="interval", seconds=600)
scheduler.start()

if __name__ == '__main__':
    app.run(host='0.0.0.0')