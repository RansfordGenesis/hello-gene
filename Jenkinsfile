pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t fastapi-hello-gene .'
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker run -d -p 8000:8000 fastapi-hello-gene'
            }
        }
    }
}
