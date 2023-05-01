pipeline {
    agent any 
    tools{
        maven 'maven'
    }
    environment {     
    DH_CRED= credentials('dockerhub')     
    }    
   stages {
        stage('Clone repository') {
             steps {
                git branch: 'main', credentialsId: '8f75af3a-1024-4e11-939a-492529bd20af', url: 'https://github.com/umi2023/repository1.git'
            }
        }
      stage('Login to Docker') { 
            steps {
                 sh 'echo docker login -u $ikbelaloui '
                echo 'Login Completed' 
             
            }
        }
        stage ('Building productcatalogue') {
            steps {
                sh "mvn clean install -f productcatalogue/pom.xml"
                echo 'productcatalogue built'
            }
        }
        stage ('Building shopfront') {
           steps {
               sh "mvn clean install -f shopfront/pom.xml"
                echo 'shopfront built'
      }
    }
        stage ('Building stockmanager') {
            steps {
                sh "mvn clean install -f stockmanager/pom.xml"
                echo 'stockmanager built '
            }
        }
        stage ('Test') {
             steps {
                 sh "mvn -f productcatalogue/pom.xml clean verify"
                 sh "mvn -f shopfront/pom.xml  clean verify"
                 sh "mvn -f stockmanager/pom.xml  clean verify"
                 echo 'Project testing Completed'
            }
        }
        stage ('Building productcatalogue docker image') {
             steps {
                 sh 'docker build -t ikbelaloui/iaproductcatalogue -f ./productcatalogue/Dockerfile  .'
                 echo 'Image productcatalogue built'
               
            }
        }
        stage ('Building shopfront docker image') {
             steps {
                 sh 'docker build -t ikbelaloui/iashopfront -f ./shopfront/Dockerfile .'
                 echo 'Image shopfront built'
               
            }
        }
        stage ('Building stockmanager docker image') {
             steps {
                 sh 'docker build -t ikbelaloui/iastockmanager -f ./stockmanager/Dockerfile .'
                 echo 'Image stockmanager built'
               
            }
      }
        stage ('Pushing productcatalogue Docker image') {
            steps {
                 sh 'docker push ikbelaloui/iaproductcatalogue'
                 echo ' Image productcatalogue Pushed'
        }
      }
        stage ('Pushing shopfront Docker image') {
        steps {

          sh 'docker push ikbelaloui/iashopfront'
          echo ' Image shopfront Pushed'
  
        }
      }
        stage ('Pushing stockmanager Docker image') {
            steps {
                sh 'docker push ikbelaloui/iastockmanager'
                echo ' Image stockmanager pushed'
            }
        }
        stage ('Clean up') {
            steps {
                sh 'docker rmi ikbelaloui/iaproductcatalogue'
                echo ' Image productcatalogue deleted'
                sh 'docker rmi ikbelaoui/iashopfront'
                echo ' Image shopfront deleted'
                sh 'docker rmi ikbelaloui/iastockmanager'
                echo ' Image stockmanager deleted'
                sh 'docker logout'
            }
        }
    }
}
