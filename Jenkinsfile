pipeline {
    agent any

    environment {
        ll = 'ls -la'
    }

    stages {
        /*
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
        */

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


        stage ('E2E Test') {
            agent{
                docker {
                    image 'mcr.microsoft.com/playwright:v1.39.0-noble'
                    reuseNode true
                }
            }
            steps {
                sh '''
                    npm install serve
                    ./node_modules/.bin/serve -s build &
                    sleep 10
                    npx playwright test
                    
                '''
            }
        }
    }
    post {
            always {
                junit 'test-results/junit.xml'
            }
        }
}