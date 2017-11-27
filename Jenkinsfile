#!groovy

// https://github.com/feedhenry/fh-pipeline-library
@Library('fh-pipeline-library') _

fhBuildNode(['label': 'openshift']) {

    final String COMPONENT = 'memcached'
    final String VERSION = '1.4.15'
    final String BUILD = env.BUILD_NUMBER
    final String DOCKER_HUB_ORG = "rhmap"
    final String DOCKER_HUB_REPO = COMPONENT
    final String CHANGE_URL = env.CHANGE_URL

    stage('Platform Update') {
        final Map updateParams = [
                componentName: COMPONENT,
                componentVersion: VERSION,
                componentBuild: BUILD,
                changeUrl: CHANGE_URL
        ]
    }

    stage('Build Image') {
        final Map params = [
                fromDir: '.',
                buildConfigName: COMPONENT,
                imageRepoSecret: "dockerhub",
                outputImage: "docker.io/${DOCKER_HUB_ORG}/${DOCKER_HUB_REPO}:${VERSION}-${BUILD}"
        ]
        buildWithDockerStrategy params
        archiveArtifacts writeBuildInfo('memcached-container', "${VERSION}-${BUILD}")
    }

}
