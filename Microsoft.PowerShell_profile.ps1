# http://serverfault.com/questions/95431
function Test-Administrator {
  $user = [Security.Principal.WindowsIdentity]::GetCurrent();
  (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function prompt {
  # https://github.com/dahlbyk/posh-git/wiki/Customizing-Your-PowerShell-Prompt
  $origLastExitCode = $LastExitCode

  # $host.UI.RawUI.WindowTitle = "asdasd"
  if (Test-Administrator) { # if elevated
    Write-Host "(Elevated) " -NoNewline -ForegroundColor White
  }

  Write-Host "$env:USERNAME@" -NoNewline -ForegroundColor DarkYellow
  Write-Host "$env:COMPUTERNAME" -NoNewline -ForegroundColor Magenta
  Write-Host " : " -NoNewline -ForegroundColor DarkGray

  $curPath = $ExecutionContext.SessionState.Path.CurrentLocation.Path
  if ($curPath.ToLower().StartsWith($Home.ToLower())) {
    $curPath = "~" + $curPath.SubString($Home.Length)
  }

  Write-Host $curPath -NoNewline -ForegroundColor Blue
  Write-Host " : " -NoNewline -ForegroundColor DarkGray
  Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor DarkMagenta
  Write-Host " : " -NoNewline -ForegroundColor DarkGray
  $LastExitCode = $origLastExitCode
  Write-VcsStatus
  "`n$('>' * ($nestedPromptLevel + 1)) "
}

Import-Module posh-git
Import-Module PSColor

# Add git aliases
. C:\Users\Developer\Code\stuff\git-alias.ps1

$global:GitPromptSettings.BeforeText = '['
$global:GitPromptSettings.AfterText = '] '

Import-Module PoShFuck
