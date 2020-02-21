// Config
class Globals {
   static String GitRepo = 'https://github.com/robliv/powershell-pipeline'
   static String ModuleName = 'ExtractSCCM'
}

// Workflow Steps
node('WS2019') {
  try {
    
    stage('Stage 0: Clone') {
      git url: Globals.GitRepo
    }
    stage('Stage 1: Analyze') {
      posh 'analyze.ps1'
    }
    stage('Stage 2: Test') {
      posh 'test.ps1'
    }
    stage('Stage 3: Publish') {
      posh 'publish.ps1'
    }
  } catch (e) {
    currentBuild.result = "FAILED"
    throw e
  } 
}

// Helper function to run PowerShell Commands
def posh(cmd) {
  bat 'powershell.exe -NonInteractive -NoProfile -ExecutionPolicy Bypass -File "' + cmd + '"'
}
