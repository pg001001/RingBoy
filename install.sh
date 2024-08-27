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
pipx install git+https://github.com/0xKayala/ParamSpider.git
pipx ensurepath
pipx completions

# install httpx
echo "Installing httpx..."
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sudo cp ~/go/bin/httpx /usr/bin/

# Rename and move NucleiScanner.sh file to /usr/bin/nucleiscanner
# Make the NucleiScanner file executable
# sudo mv NucleiScanner.sh /usr/bin/ns
# sudo chmod u+x /usr/bin/ns

# Path to the .gau.toml file
GAU_TOML_PATH="$HOME/.gau.toml"

# Create or overwrite the .gau.toml file with the configuration
echo "$CONFIG_CONTENT" > "$GAU_TOML_PATH"

CONFIG_CONTENT=$(cat <<EOF
FILTER_CODE: 404,301,302
FILTER_MIME: text/css,image/jpeg,image/jpg,image/png,image/svg+xml,image/gif,image/tiff,image/webp,image/bmp,image/vnd,image/x-icon,image/vnd.microsoft.icon,font/ttf,font/woff,font/woff2,font/x-woff2,font/x-woff,font/otf,audio/mpeg,audio/wav,audio/webm,audio/aac,audio/ogg,audio/wav,audio/webm,video/mp4,video/mpeg,video/webm,video/ogg,video/mp2t,video/webm,video/x-msvideo,video/x-flv,application/font-woff,application/font-woff2,application/x-font-woff,application/x-font-woff2,application/vnd.ms-fontobject,application/font-sfnt,application/vnd.android.package-archive,binary/octet-stream,application/octet-stream,application/pdf,application/x-font-ttf,application/x-font-otf,video/webm,video/3gpp,application/font-ttf,audio/mp3,audio/x-wav,image/pjpeg,audio/basic,application/font-otf,application/x-ms-application,application/x-msdownload,video/x-ms-wmv,image/x-png,video/quicktime,image/x-ms-bmp,font/opentype,application/x-font-opentype,application/x-woff,audio/aiff
FILTER_URL: .css,.jpg,.jpeg,.png,.svg,.img,.gif,.mp4,.flv,.ogv,.webm,.webp,.mov,.mp3,.m4a,.m4p,.scss,.tif,.tiff,.ttf,.otf,.woff,.woff2,.bmp,.ico,.eot,.htc,.rtf,.swf,.image,/image,/img,/css,/wp-json,/wp-content,/wp-includes,/theme,/audio,/captcha,/font,node_modules,/jquery,/bootstrap
FILTER_KEYWORDS: admin,login,logon,signin,signup,register,registration,dash,portal,ftp,panel,.js,api,robots.txt,graph,gql,config,backup,debug,db,database,git,cgi-bin,swagger,zip,.rar,tar.gz,internal,jira,jenkins,confluence,atlassian,okta,corp,upload,delete,email,sql,create,edit,test,temp,cache,wsdl,log,payment,setting,mail,file,redirect,chat,billing,doc,trace,ftp,gateway,import,proxy,dev,stage,stg,uat,sonar.ci.,.cp.
URLSCAN_API_KEY:
VIRUSTOTAL_API_KEY:
CONTINUE_RESPONSES_IF_PIPED: True
WEBHOOK_DISCORD: YOUR_WEBHOOK
DEFAULT_OUTPUT_DIR:
EOF
)
