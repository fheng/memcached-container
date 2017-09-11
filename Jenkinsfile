#!groovy

// https://github.com/feedhenry/fh-pipeline-library
@Library('fh-pipeline-library') _

final String COMPONENT = 'memcached'
final String VERSION = '1.4.15'
final String DOCKER_HUB_ORG = "rhmap"
final String DOCKER_HUB_REPO = COMPONENT

fhBuildNode(['label': 'openshift']) {

    stage('Build Image') {
        dockerBinaryBuild(COMPONENT, VERSION, DOCKER_HUB_ORG, DOCKER_HUB_REPO, 'dockerhubjenkins', '.')
    }

}
