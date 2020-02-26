pipeline {
  agent { label 'WS2019' }
  parameters { 
    string(name: 'publish_to', defaultValue: 'stage', description: 'Choose to deploy to Production(prod) or staging(stage)') 
    }
  environment { 
    publish_to = "${params.publish_to}"
  }
  options {
        timeout(time: 1, unit: 'HOURS') 
        skipStagesAfterUnstable()
        quietPeriod(0)
        timestamps()
    }
  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/robliv/powershell-pipeline'
      }
      post{
        success {
            echo 'clone stage success'
        }
        failure {
            echo 'clone stage failed'
        }
        unstable {
            echo 'clone stage unstable'
        }
      }
    }
    stage('Analyze') {
      steps {
        echo 'Running Analyze stage using powershell step!'
        powershell script: '.\\analyze.ps1'
      }
      post{
        success {
            echo 'analyze stage success'
        }
        failure {
            echo 'analyze stage failed'
        }
        unstable {
            echo 'analyze stage unstable'
        }
      }
    }
        stage('Test') {
      steps {
        echo 'Running Test stage!'
        powershell script: '.\\test.ps1'
      }
      post{
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
      }
    }
        stage('Publish-prod') {
      when { environment name: 'publish_to', value: 'production' }
      steps {
        echo 'Running Publish-prod stage using input!'
        input "Push to prod?"
      }
      post{
        success {
            echo 'This will run only if successful.'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
      }
    }
        stage('Publish-stage') {
      when { environment name: 'publish_to', value: 'stage' }
      steps {
        echo 'Running Publish-stage stage using input!'
        input "Push to stage env?"
      }
      post{
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
      }
    }
  }
}

def posh(cmd) {
    bat 'powershell.exe -NonInteractive -NoProfile -ExecutionPolicy Bypass -File "' + cmd + '"'
}
