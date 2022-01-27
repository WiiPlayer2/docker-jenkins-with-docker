node('docker') {
    checkout scm;

    def dockerBuild = load "ci/dockerBuild.groovy";

    def project = dockerBuild.prepare([
        imageName: 'wiiplayer2/jenkins-with-docker',
        tag: 'latest',
        registry: 'registry.hub.docker.com',
        registryCredentials: 'docker-hub-registry',
        dockerfile: './Dockerfile',
        platforms: [
            'linux/amd64',
            'linux/arm64',
        ],
    ]);

    properties([
        pipelineTriggers([
            cron('@weekly')
        ]),
    ])

    dockerBuild.buildAndPublish(project);
}
