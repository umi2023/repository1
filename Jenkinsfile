pipeline {

  environment {
    dockerimagename = "productcatalogue/app"
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git branch: 'main', credentialsId: '8f75af3a-1024-4e11-939a-492529bd20af', url: 'https://github.com/umi2023/repository1.git'
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build dockerimagename
        }
      }
    }

    stage('Pushing Image') {
      environment {
               registryCredential = 'dockerhub'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }
}

}
