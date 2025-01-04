pipeline{
    agent {
        label 'worker'
    }
    stages{
        stage("Build and Push"){
            steps{
                sh '''
                     aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 195275650098.dkr.ecr.us-east-1.amazonaws.com
                     docker build -t 195275650098.dkr.ecr.us-east-1.amazonaws.com/my-ecr:nodeimage .
                     docker push 195275650098.dkr.ecr.us-east-1.amazonaws.com/my-ecr:nodeimage
                '''
            }
        }  

        stage("Run"){
            steps{
                sh '''
                     docker run -d -p 80:8081 --name nodeapp 195275650098.dkr.ecr.us-east-1.amazonaws.com/my-ecr:nodeimage
                '''
            }
        }      
    }
}
