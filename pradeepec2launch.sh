#echo "enter ami id"
#read img_id
#echo "enter instance type"
#read instance_type
#echo "select key-pair"
#read key_name
#echo "enter sg name"
#read sg_name
#echo "enter subnet id"
#read sub_id
#echo "enter region"
#read region_name

#img_id=ami-0b500ef59d8335eee
#instance_type=t2.micro
#key_name=asg-new
#sg_name=sg-04a6d324940433647
#sub_id=subnet-0e7e366cb34aca9b2
#region_name=us-east-2

img_id=$1
instance_type=$2
sub_id=$3
region_name=$4
sg_name=$5
key_name=$6
tag_name=$7
tag_value=$8
tag_instance=$9


#aws ec2 run-instances --image-id ami-abc12345 --count 1 --instance-type t2.micro --key-name MyKeyPair --subnet-id subnet-6e7f829e --tag-specifications 'ResourceType=instance,Tags=[{Key=webserver,Value=production}]' 'ResourceType=volume,Tags=[{Key=cost-center,Value=cc123}]' 

#aws ec2 run-instances --image-id $img_id --count 1 --instance-type $instance_type --key-name $key_name --security-group-ids $sg_name --subnet-id $sub_id --region $region_name > information.txt
#grep InstanceId information.txt | tr -d '", ":' > InstanceId
#sed -i 's/InstanceId//g' InstanceId
#InstanceId=$( cat InstanceId )
#echo $InstanceId
#aws ec2 create-tags --resources $InstanceId --tags Key=Name,Value=Web3

#instancelaunch() {
aws ec2 run-instances --image-id $img_id --count 1 --instance-type $instance_type --key-name $key_name --security-group-ids $sg_name --subnet-id $sub_id --region us-east-2 > information.txt
grep 'Key\|InstanceId' information.txt | tr -d '", ":' > Instance_Id
sed -i 's/InstanceId//g' Instance_Id
sed -i 's/KeyName//g' Instance_Id
Insta_Id=$( cat Instance_Id )
echo $Insta_Id
#aws ec2 create-tags --resources $Insta_Id --region $region_name  --tags Key=Name,Value=Web3
echo $tag_name
echo $tag_value
echo $tag_instance
aws ec2 create-tags --resources $Insta_Id --region $region_name --tags Key=$tag_name,Value=$tag_value Key=Name,Value=$tag_instance
#}

#instancelaunch
