pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/RansfordGenesis/hello-gene.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t fastapi-hello-gene .'
                }
            }
        }
        stage('Run Container') {
            steps {
                script {
                    sh 'docker run -d -p 8000:8000 fastapi-hello-gene'
                }
            }
        }
    }
}
