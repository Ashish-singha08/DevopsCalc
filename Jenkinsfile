pipeline {
    environment{
        dockerImage =''
    }
    agent any
    stages {
        stage('To Clone the Git Repo') {
            steps {
               git 'https://github.com/Ashish-singha08/DevopsCalc'
            }
        }
        stage('To Build project using Maven') {
            steps {
              script{
                  sh 'mvn clean install'
              }
            }
        }
        stage('To Build Docker Image in local') {
            steps {
                script{
                  dockerImage = docker.build("ashishsinghal780/devopscalc:latest")  
                }
            }
        }
        stage('To Push local image to Docker Hub') {
            steps {
                script{
                    docker.withRegistry('','docker-cred'){
                        dockerImage.push()
                    }
                }
            }
        }
        stage('To Deploy docker image using Ansible'){
            steps{
                ansiblePlaybook becomeUser: null, colorized: true, disableHostKeyChecking: true, installation: 'Ansible', inventory: 'ansibleConfig/inventory', playbook: 'ansibleConfig/playbook.yml', sudoUser: null
            }
        }
    }
}
