create a user in ec2 instance 

	```bash 
		sudo useradd kiran
	```
create a group

	```bash	
		sudo groupadd Devops
	```
add a user to Devops

	```bash 
		sudo usermod -g Devops kiran
	```
add a passwd to kiran
	
	```bash
		sudo passwd kiran
	```
give the passwd
	
now give the owner permissions to .ssh
	
	```bash
		sudo chown -R kiran:Devops /home/kiran/.ssh
	```
	
Enable password login

	```bash
		cat /etc/ssh/sshd_config
	```
		Pubkeyauthentication "yes"
		Passwdauthentication "yes"

Now restart the ssh
	
	```bash 
		systemctl restart sshd
	```
check config is correct or not 

	```bash
		sshd -t
	```
Now login kiran 
	
	```bash 
		
		ssh kiran@<public Ip>
	```
after login

	we have to genarate a key 
	
	```bash 
		ssh-keygen -f remote
	```
now we can see there will be a two files (remote and remote.pub)

now we have to change the remote to remote.pem
		
	```bash
		mv remote remote.pem
	```
Login in to "ec2 instance"

now we have to give public key to "ec2 instance"

now after geting the publickey from kiran

we have to create a "authorized_keys" past the key in this file
	```bash
		vi /home/kiran/.ssh/authorized_keys
	```
paste the key and save it for saving we use in vi (esc :wq!)  
now we have to give permissions

		chmod 600 /home/kiran/.ssh/authorized_keys
		chmod 400 /home/kiran/.ssh/authorized_keys

now you can login kiran with private key

	```bash
		ssh -i remote.pem kiran@<public-ip>
	```
now you will successfully login





	
