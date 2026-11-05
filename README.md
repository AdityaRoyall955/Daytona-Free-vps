# 🚀 Daytona Free VPS Setup

Welcome to the **Daytona-Free-vps** repository! This repo contains automated setup scripts and utilities to configure, optimize, and manage your Daytona container development environments.

---

## 📂 Repository Contents

* `Setup.sh` — An automated initialization script designed to configure storage mounts, check system specs, and prepare your container workspace.

---

## ⚙️ Quick Start

To download and run the setup script directly in your container environment, execute the following commands:

```bash
wget https://raw.githubusercontent.com/AdityaRoyall955/Daytona-Free-vps/refs/heads/main/Setup.sh
chmod +x Setup.sh
./Setup.sh
```

---

## 🛠️ Features

* **TB-Scale Storage Mount:** Automatically binds the container's massive secondary storage partition (`/dev/md1`) to `/root/tb_storage`, bypassing tight root storage limits.
* **Persistent Landing Path:** Automatically configures your shell profile (`.bashrc`) so every new SSH login lands you directly inside your high-capacity storage directory.
* **System Diagnostics:** Instantly displays CPU core counts, live RAM status, and available storage partitions upon execution.
* **Automated Package Management:** Checks for and installs essential utilities smoothly within container constraints.

---

## 👤 Author

Maintained by **AdityaRoyall955**.
