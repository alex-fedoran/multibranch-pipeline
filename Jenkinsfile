car {
    agent { label 'agent1' }
    stages {
        stage('Build Docker image') {
            steps {
                sh 'aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 569813798269.dkr.ecr.eu-west-2.amazonaws.com'
                sh 'docker build -t nginx:${BUILD_NUMBER} . '
            }
        }
        stage('Run tests') {
            steps {
                sh 'docker run --rm nginx:${BUILD_NUMBER} nginx -t'
            }
        }
        stage('Tag and push image to registry') {
            steps {
                sh 'docker tag nginx:${BUILD_NUMBER} 569813798269.dkr.ecr.eu-west-2.amazonaws.com/academy-ecr:nginx_${BUILD_NUMBER}'
                sh 'docker push 569813798269.dkr.ecr.eu-west-2.amazonaws.com/academy-ecr:nginx_${BUILD_NUMBER}'
            }
        }
        stage('Deploy container to instance') {
            steps {
                sh 'docker pull 569813798269.dkr.ecr.eu-west-2.amazonaws.com/academy-ecr:nginx_${BUILD_NUMBER}'
                sh 'docker stop nginx_academy && exit 0'
                sh 'docker rm nginx_academy && exit 0'
                sh 'docker run -d --name nginx_academy -p 80:80 569813798269.dkr.ecr.eu-west-2.amazonaws.com/academy-ecr:nginx_${BUILD_NUMBER}'
            }
        }
        stage('Test') {
            steps {
                sh 'echo Health Checks after deploy'
                sh 'sleep 15 && curl -If http://localhost/'
            }
        }
}
        post {
          always {
            echo 'Always'
          }
          success {
            echo 'Success'
          }

          failure {
            echo 'failure'
          }

        }
    }
