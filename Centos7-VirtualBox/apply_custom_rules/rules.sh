#1.1.17 Ensure noexec option set on /dev/shm partition
echo "tmpfs /dev/shm tmpfs defaults,nodev,nosuid,noexec 0 0" >> /etc/fstab

#3.2.3 Ensure secure ICMP redirects are not accepted
sed -i 's/net.ipv4.conf.all.secure_redirects = 1/net.ipv4.conf.all.secure_redirects = 0/' /etc/sysctl.conf
sed -i 's/net.ipv4.conf.default.secure_redirects = 1/net.ipv4.conf.default.secure_redirects = 0/' /etc/sysctl.conf

#3.2.4 Ensure suspicious packets are logged
sysctl -w net.ipv4.conf.all.secure_redirects=0

sysctl -w net.ipv4.conf.default.secure_redirects=0

sysctl -w net.ipv4.route.flush=1 

#3.4.3 Ensure /etc/hosts.deny is configured
echo "ALL: ALL" >> /etc/hosts.deny

#4.2.1.3 Ensure rsyslog default file permissions configured
echo '$FileCreateMode 0640' >> /etc/rsyslog.conf

#5.2.14 Ensure SSH access is limited
echo -e "\nAllowUsers admin\n" >> /etc/ssh/sshd_config

#5.4.5 Ensure default user shell timeout is 900 seconds or less
echo -e "\nTMOUT=600\n" >> /etc/bashrc
echo -e "\nTMOUT=600\n" >> /etc/profile

#Rule to allow SSHD
echo "sshd: ALL" >> /etc/hosts.allow 


