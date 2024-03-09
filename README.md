# 📝 assessment2
[![My Skills](https://skillicons.dev/icons?i=py,flask,mongodb,docker,terraform,aws)]()


## 👨‍💻 Description
<ul>
  <li>Python flask microservice server connected to mongodb from official docker hub image</li>
  <li>Containerised with docker</li>
  <li>Easily deployed with Terraform and docker-compose</li>
  <li>Deployed on my free-tier aws EC2 instance (t2.micro)</li>
  <li>http://52.221.192.224:5001/users</li>
</ul>

## 🔌 Terraform running
1. In terraform/main.tf, edit access_key and secret_key with IAM user credentials that have sufficient privileges
2. Navigate to terraform folder and open cmd here
3. Execute these commands:
```
terraform init
terraform apply
```

## 🚀 Deployment on Cloud (Amazon Linux 2) (ALL THESE WILL BE DONE BY TERRAFORM, view user data in terraform codes.)
<ol>
  <li>Connect to ec2 instance and access the terminal</li>
  <li>Install required dependencies:</li>
  
```
sudo yum update
sudo yum install git
sudo yum install docker
sudo yum install docker-compose-plugin
```
  
  <li>Getting git repository folders into ec2 instance:</li>
  
```
mkdir assessment2
cd assessment2
git clone https://github.com/adamhcj/assessment2.git
```


<li>Deploy docker compose:</li>

```
sudo docker compose up -d
```

  <li>Ensure security groups and network access control list allows for inbound connection to the ec2 instance</li>
</ol>


## 💻 Local deployment preview:
With docker compose installed, simply navigate to root directory of this repository, and type:
```
docker compose up -d
```
![image](https://github.com/adamhcj/assessment2/assets/82926705/5fa56ce1-f4f7-4ffe-ac23-1275fded33c5)
