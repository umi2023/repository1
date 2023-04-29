pipeline {
    agent any
    tools{
        maven 'maven'
    }
    
    stages{
        stage('Build Maven'){
            steps{
                 checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: '17764f85-5dfe-4585-8504-f2e6f9c61aff', url: 'https://github.com/umi2023/repository1.git']])
                sh 'mvn clean install'
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t ikbelaloui/app .'
                }
            }
        }
        stage('Push image to hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                    sh 'docker login -u ikbelaloui -p ${dockerhub}'
                        
                    }
                    sh 'docker push ikbelaloui/app'
                }
            }
        }
 }
    
