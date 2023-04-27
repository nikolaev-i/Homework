pipeline {
  triggers {
       githubPush()
    }
    agent any

    stages {
        stage('Hello') {
            steps {
                sh 'git init'
                sh 'git config core.sparseCheckout true'
                sh 'echo "Homework-19/*" >> .git/info/sparse-checkout'
                sh 'git pull origin master'
            }
        }
    }
}
