@Library("my-shared-library") _
pipeline {
    agent {
      label 'docker-slave'
    }


    environment {
        POSTGRES_USER = 'user'
        POSTGRES_PASSWORD = 'a1a1a1'
        POSTGRES_DB = 'DB'
    }

    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'github-creds', url: 'https://github.com/Issyanofsky/FollowSpot.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def appName = 'followspot' // Define your app name
                    sh "docker build -t ${appName} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    def appName = 'followspot'
                    // Run the Docker container with PostgreSQL
                    sh """
                    docker run -d \
                        --name ${appName}-container \
                        -e POSTGRES_USER=${POSTGRES_USER} \
                        -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
                        -e POSTGRES_DB=${POSTGRES_DB} \
                        -p 5000:5000 \
                        ${appName}
                    """
                }
            }
        }
    }

    post {
        always {
            script {
                // Clean up: Stop and remove the container
//                sh 'docker stop ${appName}-container || true'
//                sh 'docker rm ${appName}-container || true'
                sh "echo 'Running app!!!!'"
            }
            echo 'Pipeline completed.'
        }
    }
}
