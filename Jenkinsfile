#!groovy

// https://github.com/feedhenry/fh-pipeline-library
@Library('fh-pipeline-library') _

final String COMPONENT = 'memcached'
final String VERSION = '1.4.15'
final String DOCKER_HUB_ORG = "rhmap"
final String DOCKER_HUB_REPO = COMPONENT

String BUILD = ""
String CHANGE_URL = ""

fhBuildNode(['label': 'openshift']) {

    BUILD = env.BUILD_NUMBER
    CHANGE_URL = env.CHANGE_URL

    stage('Platform Update') {
        final Map updateParams = [
                componentName: COMPONENT,
                componentVersion: VERSION,
                componentBuild: BUILD,
                changeUrl: CHANGE_URL
        ]
        fhCoreOpenshiftTemplatesComponentUpdate(updateParams)
    }

    stash COMPONENT
    archiveArtifacts writeBuildInfo('memcached-container', "${VERSION}-${BUILD}")
}

node('master') {
    stage('Build Image') {
        unstash COMPONENT

        final Map params = [
                fromDir: '.',
                buildConfigName: COMPONENT,
                imageRepoSecret: "dockerhub",
                outputImage: "docker.io/${DOCKER_HUB_ORG}/${DOCKER_HUB_REPO}:${VERSION}-${BUILD}"
        ]

        try {
            buildWithDockerStrategy params
        } finally {
            sh "rm -rf *"
        }
    }
}
