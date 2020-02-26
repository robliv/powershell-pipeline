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
    stage('Analyze') {
      steps {
        echo 'Running Analyze stage using batch step!'
        posh 'test1.ps1'
      }
      post{
        success {
            echo 'This will run only if successful, using pwsh step'
            pwsh 'test1.ps1'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
      }
    }
        stage('Test') {
      steps {
        echo 'Running Test stage using powershell step!'
        powershell 'test1.ps1'
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
        input "Does the staging environment look ok?"
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
        stage('Publish-stage') {
      when { environment name: 'publish_to', value: 'stage' }
      steps {
        echo 'Running Publish-stage stage using input!'
        input "Does the staging environment look ok?"
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
