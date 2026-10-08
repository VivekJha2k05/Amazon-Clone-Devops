## 📌 Features

- Amazon‑style static frontend (HTML + CSS)
- Containerized with Docker
- Automated build and deploy using Jenkins pipeline
- Hosted on AWS EC2
- Cleanup stage to avoid port conflicts
- Accessible via public IP and mapped port

---

## 🛠 Tech Stack
- **Frontend**: HTML, CSS  
- **Containerization**: Docker, Docker Compose  
- **CI/CD**: Jenkins pipeline  
- **Cloud**: AWS EC2  

---

## 📂 Project Structure

Amazon-Clone-Devops/
│── app/
│   ├── index.html
│   ├── style.css
│   ├── images/
│   └── Dockerfile
│── docker-compose.yml
│── Jenkinsfile
│── README.md

---

## ⚙️ Setup Instructions

### 0. Prerequisites
Install Docker + Docker Compose + Jenkins on your EC2 instance.

```bash
sudo apt update
sudo apt install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
docker --version

### Install Docker Compose:

sudo mkdir -p /usr/libexec/docker/cli-plugins/
sudo curl -SL "https://github.com/docker/compose/releases/latest/download/docker-compose-linux-$(uname -m)" \
  -o /usr/libexec/docker/cli-plugins/docker-compose
sudo chmod +x /usr/libexec/docker/cli-plugins/docker-compose
docker compose version

1. Clone the repository

git clone https://github.com/VivekJha2k05/Amazon-Clone-Devops.git
cd Amazon-Clone-Devops

2. Run Jenkins pipeline

Jenkinsfile stages:

1. Checkout → Pulls latest code from GitHub

2. Cleanup → Stops/removes old containers

3. Build → Builds Docker image

4. Deploy → Runs container on EC2

3. Access the app

http://<EC2-Public-IP>:9001

🛠 Troubleshooting

Port already allocated → Cleanup stage ensures old containers are removed. If issue persists:

docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

Permission denied → Add user to Docker group:

sudo usermod -aG docker $USER
newgrp docker

