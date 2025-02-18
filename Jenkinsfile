pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/allabaksh698/Java-Spring-boot-Application.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
                sh 'docker build -t my-spring-boot-app .'
            }
        }
        stage('Deploy') {
            steps {
                sshPublisher(
                    publishers: [
                        sshPublisherDesc(
                            configName: 'your-ssh-server',
                            transfers: [
                                sshTransfer(
                                    sourceFiles: '**/*.jar',
                                    removePrefix: 'target',
                                    remoteDirectory: '/var/www/html',
                                    execCommand: 'sudo docker run -d -p 8080:8080 my-spring-boot-app'
                                )
                            ]
                        )
                    ]
                )
            }
        }
    }
}
