pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/VivekJha2k05/Amazon-Clone-Devops.git'
            }
        }

        stage('Cleanup') {
            steps {
                // Stop and remove any old containers/networks
                sh 'docker compose down || true'
                sh 'docker rm -f $(docker ps -aq) || true'
                sh 'docker network prune -f || true'
            }
        }

        stage('Build') {
            steps {
                sh 'docker compose build'
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker compose up -d'
            }
        }
    }
}
