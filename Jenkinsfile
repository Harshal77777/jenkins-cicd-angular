pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'ls'
                sh 'npm install'
                sh 'echo N | ng analytics off'
                sh 'ng build'
                sh 'ls'
                sh 'cd dist && ls'
                sh 'cd dist/angular-tour-of-heroes/browser && ls'
            }
        }
        stage('S3 Upload') {
            steps {
                withAWS(region: 'ap-south-1', credentials: 'gitHub-jenkins') {
                    sh 'ls -la'
                    sh 'aws s3 cp dist/angular-tour-of-heroes/browser/. s3://angular-app-demo-new/ --recursive'
                }
            }
        }
    }
}
