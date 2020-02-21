// Config
class Globals {
   static String GitRepo = 'https://github.com/robliv/SCCMAssets'
   static String ModuleName = 'SCCMAssets'
}

// Workflow Steps
node('master') {
  try {
    
    stage('Stage 0: Clone') {
      git url: Globals.GitRepo
    }
    stage('Stage 1: Run') {
      posh 'script.ps1'
    }
  } catch (e) {
    currentBuild.result = "FAILED"
    throw e
  } 
}

// Helper function to run PowerShell Commands
def posh(cmd) {
  bat 'powershell.exe -NonInteractive -NoProfile -ExecutionPolicy Bypass -File "& ' + cmd + '"'
}
