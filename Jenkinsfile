pipeline {
    agent any

    environment {
        PATH = "C:\\Program Files\\Docker\\Docker\\resources\\bin:$PATH"
    }

    tools {
        maven 'Maven3'    
        jdk 'Java21'      
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/ivancher2025/eureka.git', credentialsId: 'github-credentials'
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t euraka .'
            }
        }

        stage('Docker Run') {
            steps {
                bat '''
                    docker stop euraka || exit 0
                    docker rm euraka || exit 0
                    docker run -d -p 8761:8761 --name euraka euraka
                '''
            }
        }

       stage('Cleanup') {
            steps {
                bat 'docker image prune -f'
            }
        }
    }
}