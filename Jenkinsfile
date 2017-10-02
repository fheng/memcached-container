#!groovy

// https://github.com/feedhenry/fh-pipeline-library
@Library('fh-pipeline-library@origin/pr/71') _

fhBuildNode(['label': 'openshift']) {

    final String COMPONENT = 'memcached'
    final String VERSION = '1.4.15'
    final String DOCKER_HUB_ORG = "rhmap"
    final String DOCKER_HUB_REPO = COMPONENT
    final String CHANGE_URL = env.CHANGE_URL

    stage('Component Update') {
        final Map updateParams = [
                componentName: COMPONENT,
                componentVersion: VERSION,
                changeUrl: CHANGE_URL
        ]
        fhCoreOpenshiftTemplatesComponentUpdate(updateParams)
    }

    stage('Build Image') {
        dockerBinaryBuild(COMPONENT, VERSION, DOCKER_HUB_ORG, DOCKER_HUB_REPO, 'dockerhubjenkins', '.')
    }

}
