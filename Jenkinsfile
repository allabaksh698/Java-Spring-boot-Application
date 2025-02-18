pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-username/my-spring-boot-app.git'
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
