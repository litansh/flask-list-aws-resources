# python flask framework

## app.py
1. Creates the list of resources per service per region running get_aws_resources.py
2. Routes to index.html main page and page 2
3. Injects the status of the website using health_check.py
4. Schedules a job to retrieve the list every 10 minutes

### ! Your own aws credentials at ~/.aws/ directory are mounted to the container, please be cautious ! ###