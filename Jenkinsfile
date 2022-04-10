pipeline {
    environment{
        dockerImage =''
    }
    agent any

    stages {
        stage('Git Pull') {
            steps {
               git 'https://github.com/Ashish-singha08/DevopsCalc'
            }
        }
        stage('Maven Build') {
            steps {
              script{
                  sh 'mvn clean install'
              }
            }
        }
        stage('Docker Build Image') {
            steps {
                script{
                  dockerImage = docker.build("ashishsinghal780/devopscalc:latest")  
                }
            }
        }
        stage('Docker Push Image') {
            steps {
                script{
                    docker.withRegistry('','docker-cred'){
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Ansibel pull docker image'){
            steps{
                ansiblePlaybook becomeUser: null, colorized: true, disableHostKeyChecking: true, installation: 'Ansible', inventory: 'deploy-docker/inventory', playbook: 'deploy-docker/calc-deploy.yml', sudoUser: null
            }
        }
    }
}
