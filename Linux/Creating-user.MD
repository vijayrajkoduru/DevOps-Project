

Login to: amazon console

	username:****
	password:****
	MFA:****
	
Creating a ec2 instance
1.Give the name
2.Select the Amazon Linux
3.Select the t3.micro
4.keypair .pem and give the name'
5.Netwrok setting (Edit)
	Security-group 
		All traffic
6.click on create 
	
	
Now creating user in amazon Linux

Login:-

ssh -i <.pem> ec2-user@<IP>

passwd:***

Creating user:-

		useradd <user name>

			username vijaykumar

useradd -N <user name> ...(-N will not create a default group with same user name)

			username -N vijaykumar

	groupadd <group name>

			groupadd DevOps

	id<user-name> check the user is created and what is the group name

			id vijaykumar

Checking user

			cat /etc/passwd

Checking group

			cat /etc/group

Give passwd to user
		
passwd<user name>

	passwd root

Add a user to a group

usermod -g <group-name> <user-name>
		
	usermod -g Devops vijaykumar

Add same user to another group (-a first group -G second group)
	
usermod -aG <group-name> <user-name>
		
	usermod -gG Devops2 vijaykumar
		
List all groups
	
	getent group

Samepecifc group

	getent group <group-name>
	
	getent group Devops2
		
Delete the user
	
	userdel <user-name>		
	
	userdel vijaykumar
		
Delete the group
	
	groupdel <group-name>
	
	groupdel DevOps
	
		