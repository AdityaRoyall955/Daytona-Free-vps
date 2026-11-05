echo "🚀 Starting System & Environment Setup..."

# 1. TB Storage & Default Landing Setup
echo "💾 Configuring 3.5TB Storage Mount..."
mkdir -p /root/tb_storage
if ! mount | grep -q "/root/tb_storage"; then
    mount --bind /var/lib/docker/ollama_models /root/tb_storage
    echo "✅ Bind-mounted /var/lib/docker/ollama_models to /root/tb_storage"
fi

# Ensure future SSH logins land in tb_storage
if ! grep -q "cd /root/tb_storage" ~/.bashrc; then
    echo "cd /root/tb_storage" >> ~/.bashrc
    echo "✅ Configured .bashrc to default to /root/tb_storage on login"
fi

# 2. System Specifications Shower
echo "=========================================="
echo "📊 SYSTEM SPECIFICATIONS"
echo "=========================================="
echo "CPU Cores: $(nproc)"
echo "RAM Status:"
free -h
echo "Storage Partitions:"
df -h /root/tb_storage
echo "=========================================="

# 3. Package Installations (Handling minimal container constraints gracefully)
echo "📦 Checking and installing available packages..."
apt-get update -y 2>/dev/null || true

# Install utilities if apt is available
for pkg in curl wget git neofetch iputils-ping python3 python3-pip nodejs npm golang; do
    if ! command -v $pkg &> /dev/null; then
        echo "Attempting to install $pkg..."
        apt-get install -y $pkg 2>/dev/null || echo "⚠️ Could not install $pkg via apt (skipping)"
    else
        echo "✔ $pkg is already installed."
    fi
done

echo "🎉 Setup complete! You are now locked into your 3.5TB storage workspace."
EOF

# Make it executable
chmod +x /root/setup.sh
