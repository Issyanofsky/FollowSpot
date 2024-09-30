@Library("my-shared-library") _
pipeline {
  agent{
    docker-slave {
      image "maven:3.6.0-jdk-13"
      label "docker"
    }
  }

  tools {
    maven "3.9.9"
  }
  stages {
    stage("Build") {
      steps {
        sh "mvn -version"
        sh "mvn clean install"
      }
    }
  }

  post {
    always {
      cleanWs()
    }
  }
}
