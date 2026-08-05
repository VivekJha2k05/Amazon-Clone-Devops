pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                echo 'Repository cloned successfully'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t amazon-clone:latest .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker stop amazon-clone || true
                docker rm amazon-clone || true
                '''
            }
        }

        stage('Run New Container') {
            steps {
                sh 'docker run -d --name amazon-clone -p 8080:80 amazon-clone:latest'
            }
        }
    }
}
