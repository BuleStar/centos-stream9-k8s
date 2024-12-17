# centos-stream9-k8s

## Installation Instructions

To install Kubernetes on CentOS Stream 9, follow the steps below:

1. Clone the repository:
   ```bash
   git clone https://github.com/BuleStar/centos-stream9-k8s.git
   cd centos-stream9-k8s
   ```

2. Make the `install_k8s.sh` script executable:
   ```bash
   chmod +x install_k8s.sh
   ```

3. Run the `install_k8s.sh` script:
   ```bash
   sudo ./install_k8s.sh
   ```

The script will perform the following actions:
- Delete old Kubernetes installations and related files
- Check the system for required tools
- Install missing dependencies
- Install Kubernetes on CentOS Stream 9

After the script completes, Kubernetes will be installed on your CentOS Stream 9 system.
