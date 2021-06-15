Problem: Create scp user which should have no privileges to do ssh.

Solution:

1) We have to Create a scp user by executing:
  - useradd -m /home/scpUser  
2) Then we have to edit sshd_config using: 
  - vim /etc/ssh/sshd_config
3) Then we have to Deny the user scp to login via ssh by adding this into the file:
  - DenyUsers scpUser
4) Then we have to restart the systemCtl service using
  - systemctl restart sshd