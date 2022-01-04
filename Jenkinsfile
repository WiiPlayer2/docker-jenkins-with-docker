pipeline {
    agent {
        label 'docker'
    }

    environment {
        IMAGE = "jenkins-with-docker"
        REGISTRY = "wiiplayer2"
        CREDENTIALS_ID = "docker-hub-registry"
    }

    stages {
        stage('Build') {
            steps {
                sh "docker build -t ${IMAGE}:latest --pull ."
            }
        }

        stage('Publish') {
            steps {
                withDockerRegistry([credentialsId: "${CREDENTIALS_ID}", url: "https://${REGISTRY}/"]) {
                    sh "docker tag ${IMAGE}:latest ${REGISTRY}/${IMAGE}:latest"
                    sh "docker image push ${REGISTRY}/${IMAGE}:latest"
                }
            }
        }
    }
}
