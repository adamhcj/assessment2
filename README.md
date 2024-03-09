# 📝 assessment2
[![My Skills](https://skillicons.dev/icons?i=py,flask,mongodb,docker,aws)]()

## 👨‍💻 Description
<ul>
  <li>Python flask microservice server connected to mongodb from official docker hub image</li>
  <li>Containerised with docker</li>
  <li>Easily deployed with docker-compose</li>
  <li>Deployed on my free-tier aws EC2 instance (t2.micro)</li>
  <li>insert link here</li>
</ul>

## 🚀 Deployment on Cloud (Amazon Linux 2)
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

<li>making persistent terminal window which continues running even after disconnecting to ec2 instance:</li>

```
sudo yum install tmux
tmux new -s mywindow
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
