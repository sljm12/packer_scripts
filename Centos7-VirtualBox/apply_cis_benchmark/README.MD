The script uses the root account to login and execute the remdiation script.

The user need to put the CIS remediation script in this directory and also add in 2 lines to the CIS script to change the passwords.

The CIS script will change the cipher that is use for the passwords without execuiting the password change in the same script you risk can't logging in after the script exits.


#Changing password for a user
echo -e 'P@ssw0rd\nP@ssw0rd' | passwd admin

#Changing the current account's password
echo -e 'P@ssw0rd\nP@ssw0rd' | passwd
