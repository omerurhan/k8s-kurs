## Kubernetes'e Giriş

### Lab Ortamının Oluşturulması
```
# PowerShell ile Windows 10 WSL2 yükleme
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform, Microsoft-Windows-Subsystem-Linux
wsl --set-default-version 2

# Microsoft Storedan Ubuntu yükleme
wsl --install Ubuntu

# WSL2 için kernel updata paketi yükleme
https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

# Docker Desktop'ı WLS2 desteği ile yükleme
# Docker Desktop'ı WSL2 için konfigüre etme
# Install Vscode and WSL Extention
# Ubuntu makimesini açma kullanıcı oluşturma
# Vscode üzerinden WSL2'de çalışan Ubuntu makinesine bağlanma
```
### Ubuntu Makinesi Üzerinde Ayarların Yapılması
````
sudo -i
# Docker install
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker run hello-world

# kubectl yükleme
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

# kind install
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.29.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# kube_ps1 install
git clone https://github.com/jonmosco/kube-ps1.git ~/kube-ps1

# kubectx install
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# bash ayarları
touch ~/.bash_aliases && cp .bash_aliases ~/.bash_aliases
source ~/.bashrc

# gcloud cli install
sudo apt-get install apt-transport-https ca-certificates gnupg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install -y google-cloud-cli
sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
gcloud init

```
