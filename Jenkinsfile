pipeline {
    agent {
        label 'docker'
    }

    stages {
        stage('Build') {
            steps {
                sh 'docker build -t wiiplayer2/jenkins-with-docker:latest --pull .'
            }
        }

        stage('Publish') {
            steps {
                sh 'docker image push wiiplayer2/jenkins-with-docker:latest'
            }
        }
    }
}
