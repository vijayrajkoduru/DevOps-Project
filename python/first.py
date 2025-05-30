import os
import subprocess
import sys
from datetime import datetime
import ctypes

# Colors
R = "\033[31m"
G = "\033[32m"
Y = "\033[33m"
N = "\033[0m"

# Constants
LOGS_FOLDER = "/var/log/expense-logs" if os.name != 'nt' else "C:/expense-logs"
SCRIPT_NAME = os.path.splitext(os.path.basename(__file__))[0]
TIMESTAMP = datetime.now().strftime("%Y-%m-%d-%H-%M-%S")
LOG_FILE_NAME = os.path.join(LOGS_FOLDER, f"{SCRIPT_NAME}-{TIMESTAMP}.log")

# Ensure log folder exists
os.makedirs(LOGS_FOLDER, exist_ok=True)

def log(message):
    with open(LOG_FILE_NAME, "a") as f:
        f.write(message + "\n")

def run_command(cmd, description):
    print(f"{description}...", end="")
    log(f"[{TIMESTAMP}] Executing: {cmd}")
    result = subprocess.run(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    log(result.stdout.decode())

    if result.returncode != 0:
        print(f"{R} FAILURE {N}")
        log(f"FAILED: {description}")
        sys.exit(1)
    else:
        print(f"{G} SUCCESS {N}")
        log(f"SUCCESS: {description}")

def check_root():
    if os.name == 'nt':
        # Windows check for admin
        try:
            is_admin = ctypes.windll.shell32.IsUserAnAdmin() != 0
        except:
            is_admin = False
        if not is_admin:
            print(f"{R}ERROR: Run this script as Administrator{N}")
            sys.exit(1)
    else:
        # Linux/Unix check for root
        if os.geteuid() != 0:
            print(f"{R}ERROR: Run this script as root (sudo){N}")
            sys.exit(1)

# ========== Execution Starts ==========
check_root()
log(f"Script started at: {TIMESTAMP}")

# Linux-specific commands (will fail on Windows unless you adapt them)
run_command("dnf install nginx -y", "Installing Nginx Server")
run_command("systemctl enable nginx", "Enabling Nginx Server")
run_command("systemctl start nginx", "Starting Nginx Server")
run_command("rm -rf /usr/share/nginx/html/*", "Removing existing HTML files")
run_command("curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip", "Downloading latest code")
run_command("unzip /tmp/frontend.zip -d /usr/share/nginx/html", "Unzipping frontend code")
run_command("cp /home/ec2-user/expense-shell/expense.conf /etc/nginx/default.d/expense.conf", "Copying Nginx config")
run_command("systemctl restart nginx", "Restarting Nginx")

print(f"{G}Deployment Complete. Logs saved at: {LOG_FILE_NAME}{N}")
