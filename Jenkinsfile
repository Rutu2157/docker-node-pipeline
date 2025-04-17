pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/your-username/node-docker-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("nodeapp:v1")
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 8082:8082 --name nodeapp nodeapp:v1'
            }
        }
    }
}
