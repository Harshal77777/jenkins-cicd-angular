pipeline {
    agent any
    environment {
        IMAGE_NAME = "harshal0796/angular-app"
    }
    triggers {
        githubPush()  // This ensures the pipeline runs when a new push occurs
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Harshal77777/jenkins-cicd-angular.git'
            }
        }

        stage('Build & Cache Dependencies') {
            steps {
                sh 'docker build -t new-image1 .'
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    sh 'docker push new-image1'
                }
            }
        }

        stage('Deploy Container') {
            steps {
                sh 'docker run -d -p 80:80 --name angular-container new-image1 || docker restart angular-container'
            }
        }
    }
}
