@Library("my-shared-library") _
pipeline {
  agent any
  enviroment {
    POSTGRES_USER=''
    POSTGRES_PASSWORD=''
    POSTGRES_DB=''
  }
  stages {
    stage("checkout") {
      steps {
        git credentialsId: 'github-creds', url: 'https://github.com/Issyanofsky/FollowSpot.git'       
      }
    }
    stage("Build Docker Container") {
      steps {
        script {
          def appname = 'server.py'
          sh """
            docker run -d \
              --name${appname}-container \
              -e POSTGRES_USER=${POSTGRES_USER} \
              -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
              -e POSTGRES_DB+${POSTGRES_DB} \
              -p 5000:5000
              ${appname}
          """
        }
      }
    }
  }

  post {
    always {
      script {
        sh 'docker stop ${appname}-container || true'
        sh 'docker rm ${appname}-container || true'
      }
      cleanWs()
    }
  }
}
