node('docker') {
    checkout scm;

    def dockerBuild = load "ci/dockerBuild.groovy";

    def project = [
        imageName: 'wiiplayer2/jenkins-with-docker',
        tag: 'latest',
        registry: 'registry.hub.docker.com',
        registryCredentials: 'docker-hub-registry',
        dockerfile: './Dockerfile',
    ];

    properties([
        pipelineTriggers([
            cron('@weekly')
        ]),
    ])

    stage('Build') {
        dockerBuild.build(project);
    }

    stage('Publish') {
        dockerBuild.publish(project);
    }
}
