#!groovy

// https://github.com/feedhenry/fh-pipeline-library
@Library('fh-pipeline-library') _

def COMPONENT = 'memcached'
def VERSION = '1.4.15'
def DOCKER_HUB_ORG = "rhmap"
def DOCKER_HUB_REPO = COMPONENT

fhBuildNode(['label': 'openshift']) {

    stage('Build Image') {
        dockerBinaryBuild(COMPONENT, DOCKER_HUB_ORG, DOCKER_HUB_REPO, "dockerhubjenkins", VERSION) {
            sh "oc start-build ${COMPONENT}-bc --follow=true --from-dir ."
        }
    }

}
