#!/bin/bash

# Function to delete old Kubernetes installations and related files
delete_old_k8s() {
    echo "Deleting old Kubernetes installations and related files..."
    sudo kubeadm reset -f
    sudo yum remove -y kubelet kubeadm kubectl
    sudo rm -rf /etc/kubernetes /var/lib/etcd /var/lib/kubelet /etc/systemd/system/kubelet.service.d
    sudo systemctl daemon-reload
    sudo systemctl reset-failed
}

# Function to check the system for required tools
check_required_tools() {
    echo "Checking for required tools..."
    required_tools=("curl" "wget" "git" "yum-utils")
    for tool in "${required_tools[@]}"; do
        if ! command -v $tool &> /dev/null; then
            echo "$tool is not installed. Installing..."
            sudo yum install -y $tool
        else
            echo "$tool is already installed."
        }
    done
}

# Function to install missing dependencies
install_dependencies() {
    echo "Installing missing dependencies..."
    sudo yum install -y epel-release
    sudo yum install -y containerd.io
    sudo systemctl enable containerd
    sudo systemctl start containerd
}

# Function to install Kubernetes on CentOS Stream 9
install_k8s() {
    echo "Installing Kubernetes..."
    sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
    sudo systemctl enable kubelet
    sudo systemctl start kubelet
}

# Main script execution
delete_old_k8s
check_required_tools
install_dependencies
install_k8s

echo "Kubernetes installation on CentOS Stream 9 is complete."
