import boto3

regions = ["us-east-1"]

def get_aws_ec2_resources():

    service = 'ec2'

    file1 = open("my_aws_resources.txt", "w")
    file1 = open("my_aws_resources.txt", "a")
    file1.write("Service: "+service + "\n")

    for regionname in regions:

        session = boto3.Session(profile_name='default')
        ec2client = session.client(service, region_name=regionname)
        file1.write("Region: "+regionname + "\n")
        instanceresponse = ec2client.describe_instances()
        for reservation in instanceresponse["Reservations"]:
            for instance in reservation["Instances"]:
                file1 = open("my_aws_resources.txt", "a")
                file1.write("Instance ID: "+instance["InstanceId"]+"\n")

    file1.write("\n")
    file1.close()


def get_aws_rds_resources():

    service = 'rds'

    file1 = open("my_aws_resources.txt", "a")
    file1.write("Service: "+service + "\n")

    for regionname in regions:
        client = boto3.client(service, region_name=regionname)
        file1.write("Region: "+regionname + "\n")
        db_instances = client.describe_db_instances()
        for i in range(len(db_instances)):
            j = i - 1
            try:
                DBName = db_instances['DBInstances'][j]['DBName']
            except KeyError:
                DBName = "+++ DBName gave KeyError +++"
            MasterUsername = db_instances['DBInstances'][0]['MasterUsername']
            DBInstanceClass = db_instances['DBInstances'][0]['DBInstanceClass']
            DBInstanceIdentifier = db_instances['DBInstances'][0]['DBInstanceIdentifier']
            Endpoint = db_instances['DBInstances'][0]['Endpoint']
            Address = db_instances['DBInstances'][0]['Endpoint']['Address']
            file1 = open("my_aws_resources.txt", "a")
            file1.write("{} {} {} {} {}".format(Address, MasterUsername, DBName, DBInstanceClass,
            DBInstanceIdentifier)+"\n")

    file1.write("\n")
    file1.close()
   

def get_aws_sg_resources():
    
    service = 'security groups'

    file1 = open("my_aws_resources.txt", "a")
    file1.write("Service: "+service + "\n")

    for regionname in regions:
    
        client = boto3.client('ec2', region_name=regionname)
        file1.write("Region: "+regionname + "\n")
        file1 = open("my_aws_resources.txt", "a")
        file1.write(str([{"name": f_group['GroupName']}
            for f_group in client.describe_security_groups()['SecurityGroups']]))
        
    file1.write("\n\n")
    file1.close()


def get_aws_elb_resources():

    service = 'ELB'

    file1 = open("my_aws_resources.txt", "a")
    file1.write("Service: "+service + "\n")

    for regionname in regions:
        elbList = boto3.client('elb', region_name=regionname)
        file1.write("Region: "+regionname + "\n")
        ec2 = boto3.resource('ec2')

        bals = elbList.describe_load_balancers()
        for elb in bals['LoadBalancerDescriptions']:
            file1.write("ELB DNS Name : " + elb['DNSName'])
            for ec2Id in elb['Instances']:
                running_instances = \
                    ec2.instances.filter(Filters=[{'Name': 'instance-state-name'
                                        , 'Values': ['running']},
                                        {'Name': 'instance-id',
                                        'Values': [ec2Id['InstanceId']]}])
        
    file1.write("\n")
    file1.close()

def all_services():
    get_aws_ec2_resources()
    get_aws_rds_resources()
    get_aws_sg_resources()
    get_aws_elb_resources()