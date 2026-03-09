pipeline {
    agent any

    environment {
        ll = 'ls -la'
    }

    stages {
        stage('Build'){
            agent{
                docker {
                    image 'node:18-alpine'
                    reuseNode true
                }
            }
            steps {
                sh '''
                    ${ll}
                    node --version
                    npm --version
                    npm ci
                    npm run build
                    ${ll}
                '''
                
            }
        }
        stage ('Test') {
            steps {
                sh '''
                    ${ll}
                    npm test
                '''
            }
        }
    }
}