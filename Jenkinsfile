pipeline {
    agent any

    tools {
        maven 'Maven 3.x' // Name of the Maven installation configured in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/allabaksh698/Java-Spring-boot-Application.git'
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
