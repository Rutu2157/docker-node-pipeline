pipeline {
    agent any

    environment {
        IMAGE_NAME = "rutu2157/docker-node-pipeline"
        DOCKERHUB_CREDENTIALS_ID = "dockerhub-credentials" // Jenkins credentials ID
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKERHUB_CREDENTIALS_ID}", usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS')]) {
                    sh 'echo $DOCKERHUB_PASS | docker login -u $DOCKERHUB_USER --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.image("${IMAGE_NAME}").push('latest')
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh """
                        docker rm -f node-app || true
                        docker run -d --name node-app -p 3000:3000 ${IMAGE_NAME}:latest
                    """
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline Finished.'
        }
    }
}
