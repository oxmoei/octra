# Octra Public Testnet

![testnet](https://github.com/user-attachments/assets/aa4f05f1-0f0a-41d0-8ed8-df215b340c46)

## Join Discord
https://discord.gg/octra

---

## Requirements
Linux Ubuntu OS
* **VPS**: You can use a linux VPS to follow the guide
* **Windows**: Install Linux Ubuntu using WSL by following this [guide](https://github.com/0xmoei/Install-Linux-on-Windows)
* **Codespace**: If you don't have VPS or Windows WSL, you can use [Github Codespace](https://github.com/codespaces), create a blank template and run your codes.

---
## Support system

- ![macOS](https://img.shields.io/badge/-macOS-000000?logo=apple&logoColor=white)
- ![Linux](https://img.shields.io/badge/-Linux-FCC624?logo=linux&logoColor=black)

## Clone the repository
   ```bash
   git clone https://github.com/oxmoei/octra.git
   cd octra
   ```

## Install dependecies

```bash
chmod +x ./install.sh
sudo ./install.sh
```

---

## Create wallet
### 1. Run the wallet generator webserver
   **WSL/Linux/macOS:**
   ```bash
   chmod +x ./start.sh
   ./start.sh
   ```


### 2. Open your browser
* **WSL/Linux/MAC users:**
  * Navigate to `http://localhost:8888` on browser

  
* **VPS users:**
  * 1- Open a new terminal
  * 2- Install **localtunnel**:
    ```
    npm install -g localtunnel
    ```
  * 3- Get a password:
    ```
    curl https://loca.lt/mytunnelpassword
    ```
  * The password is actually your VPS IP
  * 4- Get URL
    ```
    lt --port 8888
    ```
  * Visit the prompted url, and enter your password to access wallet generator page

### 3. Generate wallet
* Click "GENERATE NEW WALLET" and watch the real-time progress
* Save all the details of your Wallet

---

## Get Faucet
* Visit [Faucet page](https://faucet.octra.network/)
* Enter your address starting with `oct...` to get faucet

![image](https://github.com/user-attachments/assets/18597b40-eaad-434f-a026-cc4a56a6d1a8)

---

## Configure Octra CLI and Wallet

**1. Install Python**
```bash
sudo apt install python3 python3-pip python3-venv python3-dev -y
```

**2. Install CLI**
```bash
git clone https://github.com/octra-labs/octra_pre_client.git
cd octra_pre_client

python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

cp wallet.json.example wallet.json
```

**3. Add wallet to CLI**
```bash
nano wallet.json
```
* Replace following values:
  * `private-key-here`: Privatekey with `B64` format
  * `octxxxxxxxx...`: Octra address starting with `oct...`


**4. Run CLI**
```bash
python3 -m venv venv
source venv/bin/activate
python3 cli.py
```
* This should open a Testnet UI

![image](https://github.com/user-attachments/assets/0ba1d536-4048-4899-a977-4517b2e522cd)

---

## Update CLI
After each new task, existing users must update their CLI

### Option A: Normal Update
Update git:
```bash
cd octra_pre_client
git pull origin main
```
* If you see an error about uncommitted changes (e.g., in `cli.py` or other files), stash your changes:
```bash
git stash
git pull origin main
```

Install requirements:
```
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

### Option B: Wipe and Reclone (Use if Option A fails or you want a clean setup)
Update git:

* Preserve your `wallet.json` file, wipe the repository, and reclone it:
```
mv $HOME/octra_pre_client/wallet.json $HOME/wallet.json
cd && rm -rf octra_pre_client && git clone https://github.com/octra-labs/octra_pre_client.git
mv $HOME/wallet.json $HOME/octra_pre_client/wallet.json
cd octra_pre_client
```

Install requirements:
```
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```
---

## Testnet Tasks

## Run CLI
```bash
cd octra_pre_client
python3 -m venv venv
source venv/bin/activate
python3 cli.py
```

## Send transactions
* 1- Encrypt balance
* 2- Send private transaction to another address
  * You can send private transactions to my address: `octBvPDeFCaAZtfr3SBr7Jn6nnWnUuCfAZfgCmaqswV8YR5`
  * Use [Octra Explorer](https://octrascan.io/) to find more octra addresses

---

## Wait for next steps
Stay tuned.
