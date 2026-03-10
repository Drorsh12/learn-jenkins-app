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
                    node --version
                    npm --version
                    npm ci
                    npm run build
                '''
                
            }
        }
        stage ('Test') {
            agent{
                docker {
                    image 'node:18-alpine'
                    reuseNode true
                }
            }
            steps {
                sh '''
                    ls -l
                    npm run file_check
                    npm test
                    
                '''
            }
        }
    }
}