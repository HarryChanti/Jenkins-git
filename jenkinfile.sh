pipeline {
  agent any
  environment {
     DOCKERHUB_CREDENTIALS = credentials ('dockerhub')
  }
  stages {
      stage('build'){
      steps {
          sh 'docker build -t dockerhchanti/jenkins-docker-hub:2 . '
       }
       }
   stage('login') {
   steps {
    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
   }
   }
   stage('push') {
     steps {
         sh 'docker push dockerhchanti/jenkins-docker-hub:2'
   }
   }

}
}
post {
        always {
            sh 'docker logout'
        }
    }
}  
