node { checkout scm
    environment {
        DOCKERHUB_CREDENTIALS = credentials ('dockerhub')
         // /registry= 'dockerhchanti/jenkins-alpain'
    }
    stage('Build and Push') {
        docker.withRegistry('', 'dockerhub')
        {
            def CustomImage = docker.build('dockerhchanti/jenkins-alpain')
            CustomImage.push()
        }
    }
    //    stage('SCM Checkout') {
    //     git branch: 'main', credentialsId: 'github', url: 'https://github.com/HarryChanti/Jenkins-git.git'
    //    }
    //    stage('Build') {
        
    //         sh 'docker build -t dockerhchanti/jenkins-alpain:11 .'
        
    //     }
    //    stage('login') {
        
    //         sh -c 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login --username $DOCKERHUB_CREDENTIALS_USR --password-stdin'
        
    //    }
    //    stage('Push') {
            
    //             sh 'docker push dockerhchanti/jenkins-alpain:11'
           
//   }
    
    
    
}   
  
