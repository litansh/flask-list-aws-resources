import requests


def web_response():

    url = "http://host.docker.internal:5000"

    try:
        resp_code = requests.get(url)
        print(resp_code, flush=True)
        resp = "UP"
        output = "UP"
        debug = "INFO"
    except Exception as e:
        resp = "Down"
        output = "Down!!!"
        debug = "ERROR"
        print(debug + ": ", e, flush=True)

    print(debug + ": Flask status: ", output, flush=True)

    return resp
