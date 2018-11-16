pipeline {
    agent {
        docker { 
            image 'ubuntu-test'
            args '-u 0:0 -p 1022:22 -h env01 '
             
        }
    }
    stages {
        stage('Config') {
            steps {
                sh 'cat /etc/hostname'
                sh '/etc/init.d/ssh restart'
                sh 'apt-get install -y atop'
                sh 'whoami'
                sh 'sleep 10'
                input 'Go to the Next Step :'

            }
            
        }    
    
        stage('RUN') {
            steps {
              echo '=== RUN ==='
              sh 'sleep 2' 
              git credentialsId: '291e6752-7199-431f-ad43-36f0d2beace3', url: 'https://github.com/g545450/Project_001.git'
              input 'Go to the Next Step :'

            }
        }
        
        stage('Test') {
            steps {
              echo '=== Test ==='
              sh 'sleep 2' 
              input 'Go to the Next Step :'

            }
        }
   
        
        stage('Integ') {
            steps {
              echo '=== Integ ==='
              sh 'sleep 2' 
              input 'Go to the Next Step :'

            }
        }
    }
}
