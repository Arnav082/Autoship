pipeline {
    agent any
    stages {
        stage('Deploy') {
            steps {
                sh 'ssh ubuntu@172.31.28.133 "project/deploy.sh"'
            }
        }
    }
} 