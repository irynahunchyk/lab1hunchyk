pipeline {
    agent any
    
    stages {
        stage('Build Docker image') {
            steps {
                sh "docker build -t image ."
            }
        }
        
        stage('Cleanup') {
            steps {
                sh '/usr/local/bin/docker rmi image'
            }
        }
    }
}
