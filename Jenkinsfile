pipeline {

    agent any

    environment {

        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        AWS_DEFAULT_REGION    = 'us-east-1'

    }

    options {

        timestamps()

        disableConcurrentBuilds()

        buildDiscarder(logRotator(numToKeepStr: '10'))

    }

    stages {

        stage('Checkout Source') {

            steps {

                git branch: 'aws-terraform',
                    credentialsId: 'github-pat',
                    url: 'https://github.com/ALFAHADH/Terraform-Hands-on.git'

            }

        }

        stage('Terraform Version') {

            steps {

                sh '''
                terraform version
                aws --version
                '''

            }

        }

        stage('Terraform Init') {

            steps {

                sh '''
                terraform init
                '''

            }

        }

        stage('Terraform Format Check') {

            steps {

                sh '''
                terraform fmt -check
                '''

            }

        }

        stage('Terraform Validate') {

            steps {

                sh '''
                terraform validate
                '''

            }

        }

        stage('Terraform Plan') {

            steps {

                sh '''
                terraform plan -out=tfplan
                '''

            }

        }

        stage('Approval') {

            steps {

                input(
                    message: 'Terraform Plan completed. Proceed with Apply?',
                    ok: 'Apply Infrastructure'
                )

            }

        }

        stage('Terraform Apply') {

            steps {

                sh '''
                terraform apply -auto-approve tfplan
                '''

            }

        }

    }

    post {

        always {

            echo "Cleaning workspace..."

            cleanWs()

        }

        success {

            echo "Terraform deployment completed successfully."

        }

        failure {

            echo "Terraform deployment failed."

        }

    }

}