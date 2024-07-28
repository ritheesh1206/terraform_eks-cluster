# update the vm
apt-get update

# Install zip
apt install zip -y

# install java
add-apt-repository ppa:openjdk-r/ppa
apt-get update
apt-get install -y fontconfig openjdk-17-jre openjdk-17-jdk

# install tar
apt install tar

# install aws cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install

# configure aws 
aws --version
aws configure set aws_access_key_id #################
aws configure set aws_secret_access_key ###################
aws configure set region us-east-1
aws configure set output json
