# STEP 1: Install Chocolatey if missing
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = 3072
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

refreshenv

# STEP 2: Install all required software
choco install docker-desktop -y
choco install python --version=3.10.11 -y
choco install git -y
choco install vscode -y
choco install nodejs-lts -y
choco install vcredist140 -y

# STEP 3: Clone the AI package
cd $env:USERPROFILE\Documents
git clone https://github.com/Value-Chain-Hackers/local-ai-packaged-forQA.git
cd local-ai-packaged-forQA

# STEP 4: Copy .env file
cp .env.example .env

# STEP 5: Start the system using CPU profile
python start_services.py --profile cpu
