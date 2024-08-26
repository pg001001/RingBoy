#!/bin/bash

mkdir /root/tool

sudo apt-get update

sudo apt-get install -y libcurl4-openssl-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y jq
sudo apt-get install -y ruby-full
sudo apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev build-essential libgmp-dev zlib1g-dev
sudo apt-get install -y xargs
sudo apt install -y pipx
pipx ensurepath	

echo "installing bash_profile aliases from recon_profile"
git clone https://github.com/nahamsec/recon_profile.git
cd recon_profile
cat bash_profile >> ~/.bash_profile
source ~/.bash_profile
echo "done"

# Install dependencies
sudo apt-get install -y python3 python3-pip python3-venv git curl unzip

wget https://golang.org/dl/go1.22.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.22.4.linux-amd64.tar.gz
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >> ~/.bashrc
echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> ~/.profile
source ~/.profile
source ~/.bashrc

# Install subdomain script 

# Install subfinder
echo "Installing subfinder..."
echo export PATH=$PATH:$HOME/go/bin >> $home/.bashrc
source $home/.bashrc
git clone https://github.com/projectdiscovery/subfinder.git
cd subfinder/v2/cmd/subfinder
go build
mv subfinder /usr/local/bin

# install gau
echo "Installing gau..."
go install github.com/lc/gau/v2/cmd/gau@latest
sudo cp ~/go/bin/gau /usr/local/bin/

# install nuclie 
go install -v github.com/projectdiscovery/nuclei/v3/cmd/nuclei@latest
sudo cp ~/go/bin/nuclei /usr/local/bin/

# install paramspider 
pipx install git+https://github.com/devanshbatham/ParamSpider.git
pipx ensurepath

# Rename and move NucleiScanner.sh file to /usr/bin/nucleiscanner
sudo mv NucleiScanner.sh /usr/bin/ns

# Make the NucleiScanner file executable
sudo chmod u+x /usr/bin/ns

# Remove the NucleiScanner folder from the home directory
if [ -d "$home_dir/NucleiScanner" ]; then
    echo "Removing NucleiScanner folder..."
    rm -r "$home_dir/NucleiScanner"
fi

echo "NucleiScanner has been installed successfully! Now Enter the command 'ns' to run the tool."
