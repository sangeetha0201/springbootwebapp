
pipeline {
    environment {
        registry = "sandeep4642/springbootwebapps" 
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    agent none
    stages { 
        stage ('Build') {
            agent any
            steps {
                bat 'mvn clean install package' 
            }
        }

        stage ('Build Docker image') {
            agent { label 'slave1'}
            steps {
                script { 
                 sh dockerImage = docker.build registry + ":$BUILD_NUMBER" 
            } 
            }
        }
        stage('Deploy our image into Registry') { 
            agent { label 'slave1'}
            steps { 
                script { 
                  sh  docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                    }
                } 
            }
        }

        stage('Cleaning up') { 
            agent { label 'slave1'}
            steps { 
                sh "docker rmi $registry:$BUILD_NUMBER" 
            }
        } 
    }
}
