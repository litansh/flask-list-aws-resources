import boto3

regions = ["us-east-1"]
resources = ['ec2']

def get_aws_resources():

    file1 = open("my_aws_resources.txt", "w")

    for regionname in regions:
        for resource in resources:
            file1 = open("my_aws_resources.txt", "a")
            file1.write(resource)
            session = boto3.Session(profile_name='default')
            ec2client = session.client(resource, region_name=regionname)
            instanceresponse = ec2client.describe_instances()
            for reservation in instanceresponse["Reservations"]:
                for instance in reservation["Instances"]:
                    file1 = open("my_aws_resources.txt", "a")
                    file1.write(instance["InstanceId"]+"\n")
    file1.close()