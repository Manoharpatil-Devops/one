pipeline {
    agent any  // Runs on any available agent

    environment {
        // Define the AWS region and the instance ID of the EC2 you want to stop
        REGION = 'us-east-1'  // Update with your AWS region (e.g., 'us-east-1', 'us-west-2', etc.)
        INSTANCE_ID = 'i-0dfe4cbbe9e6f6803'  // Replace with the actual EC2 instance ID
    }

    stages {
        stage('Start EC2 Instance') {
            steps {
                script {
                    // Use AWS credentials from Jenkins (AWS credentials plugin)
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'Instance creds']]) {
                        
                        // Debugging: Print the INSTANCE_ID and REGION to ensure they are set correctly
                        echo "Started EC2 instance with ID: ${INSTANCE_ID}"
                        echo "Region: ${REGION}"

                        // AWS CLI command to stop the EC2 instance
                        sh '''
                            aws ec2 start-instances --instance-ids $INSTANCE_ID --region $REGION
                            echo "EC2 Instance started successfully."
                        '''
                    }
                }
            }
        }
    }

    post {
        always {
            // This block runs after the pipeline completes
            echo "Pipeline completed."
        }
        success {
            // This block runs if the pipeline succeeds
            echo "EC2 instance stopped successfully."
        }
        failure {
            // This block runs if the pipeline fails
            echo "An error occurred while stopping the EC2 instance."
        }
    }
}
