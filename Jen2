pipeline {
    agent any

    environment {
        IMAGE_NAME = "harshal0796/angular-app"
        CACHE_DIR = "$WORKSPACE/node_modules"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Harshal77777/jenkins-cicd-angular.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh '''
                if [ -d "$CACHE_DIR" ]; then
                    echo "Using cached node_modules"
                else
                    npm ci --legacy-peer-deps
                fi
                '''
            }
        }

        stage('Build Angular App') {
            steps {
                sh 'npm run build --prod'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t new-image1 .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: '']) {
                    sh 'docker push new-image1'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -d -p 80:80 --name angular-app new-image1'
            }
        }
    }
}
