pipeline {
    agent {
        label 'docker'
    }

    triggers {
        cron('@weekly')
    }

    environment {
        IMAGE = "wiiplayer2/jenkins-with-docker"
        REGISTRY = "registry.hub.docker.com"
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
