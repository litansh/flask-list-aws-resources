from flask import Flask, render_template
from apscheduler.schedulers.background import BackgroundScheduler
import get_aws_resources, health_check

def create_my_aws_resources_file():
    get_aws_resources.all_services()

create_my_aws_resources_file()

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

@app.context_processor
def inject_status_code():
    status_code = health_check.web_response()
    return {'uptime1': status_code}

scheduler = BackgroundScheduler()
scheduler.add_job(func=get_aws_resources.all_services, trigger="interval", seconds=600)
scheduler.start()

if __name__ == '__main__':
    app.run(host='0.0.0.0')