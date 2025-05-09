pipeline {
    agent any

    environment {
        DOCKER_USERNAME = "ditdevops1"
        IMAGE_VERSION = "1.${BUILD_NUMBER}"
        DOCKER_IMAGE = "${DOCKER_USERNAME}/tp-app:${IMAGE_VERSION}"
        DOCKER_CONTAINER = "ci-cd-html-css-app"
        DOCKER_CREDENTIALS = credentials("c51aa3f7-82ee-4b60-828c-376f73dd3951")
    }

    stages {
        stage("Checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/matrixunplgd/ci-cd-html-css-demo.git'
            }
        }

        stage("Test") {
            steps {
                echo "Tests en cours"
            }
        }

        stage("Build Docker Image") {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }

        stage("Push image to Docker Hub") {
            steps {
                script {
                    sh """
                        docker login -u ${DOCKER_CREDENTIALS_USR} -p ${DOCKER_CREDENTIALS_PSW}
                        docker push $DOCKER_IMAGE
                    """
                }
            }
        }

        stage("Deploy") {
            steps {
                script {
                    sh """
                        docker rm -f $DOCKER_CONTAINER || true
                        docker run -d --name $DOCKER_CONTAINER -p 8080:80 $DOCKER_IMAGE
                    """
                }
            }
        }
    }
}
