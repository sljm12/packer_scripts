This is a set of scripts for Packer by Hashicorp that helps me build a base image for CentOS and updates the packages

This assumes that packer.exe is in the root directory of this repo and that we are using virtualbox as the hypervisor

run "setpath.bat" to set the packer.exe into the path and also to set PACKER_LOG=1 for verbose logging so that you can see the ssh output


The sequence in which they are run
1. baseos
- run "packer build vb.json"
- Ensure the CentOS7 DVD iso is placed in this directory
2. apply_cis_benchmark
- run "packer build cis_benchmark.json"
- For this step place the CIS Remdiation script in the directory 
- add 2 lines to the bottom of the script to reset the password when the cipher is changed. If not u might find yourself unable to login after the remediation is done
echo -e 'P@ssw0rd\nP@ssw0rd' | passwd admin
echo -e 'P@ssw0rd\nP@ssw0rd' | passwd
3. apply_custom_rules
- run "packer build custom.json"

