pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
		        echo "ok ok"
	            sh "ls"
	        }
        }
        stage('Slack Message') {
            steps {
                slackSend color: 'good',
                    message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}"
            }
        }
    }
}
