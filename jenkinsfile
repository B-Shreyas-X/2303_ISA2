pipeline {
    agent any

    environment {
        IMAGE_NAME = '2303_img'
        CONTAINER_NAME = '2303_container' 
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Delete Existing Container') {
            steps {
                script {
                    // Check if the container exists and remove it
                    sh """
                    if [ \$(docker ps -aq -f name=${CONTAINER_NAME}) ]; then
                        docker rm -f ${CONTAINER_NAME}
                    fi
                    """
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh "docker run -d --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'

        }
    }
}
