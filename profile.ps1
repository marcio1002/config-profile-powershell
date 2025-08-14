## POWERSHELL 7

#Configuration Autocompletion keys
Import-Module PSReadLine -RequiredVersion 2.3.6
Import-Module Az.Tools.Predictor
Import-Module TrustedPlatformModule
Import-Module MavenAutoCompletion -RequiredVersion 0.2
Import-Module -Name kmt.winget.autocomplete
Import-Module -Name "C:\Users\marcio.alemao_satsol\Documents\scripts\javaVersionManager"

# Código ASCII para escape
$esc = "`e"
$escEnd = "`e[0m"
# Simbolos
$curvaLeftTop = "${esc}[90m┌─${escEnd}"
$curvaRightTop = "${esc}[90m─┐${escEnd}"
$indicator = "${esc}[96m➜${escEnd}"
# Cores esquerda
$simbolStart = "${esc}[92m${escEnd}"
$bgLeft = "${esc}[92m░${escEnd}"
$bgLeftSecond = "${esc}[92m▒${escEnd}"
$bgLeftThird = "${esc}[37;42m ${escEnd}"
# Cores direita
$simbolEnd = "${esc}[92m${escEnd}";
$simbolEndWithBranch = "${esc}[34m${escEnd}";
$bgRight = "${esc}[32m░${escEnd}"
$bgRightWithBranch = "${esc}[34m░${escEnd}"
$bgRightSecond = "${esc}[32m▒${escEnd}"
$bgRightSecondWithBranch = "${esc}[34m▒${escEnd}"
$bgRightThird = "${esc}[37;42m ${escEnd}"
$bgRightThirdWithBranch = "${esc}[44m ${escEnd}"

# Customização do prompt
function prompt {
    $pathCurrent = Get-Location | Split-Path -Leaf
    $branch = if (git branch --show-current) { git branch --show-current } else { "" }
    
    $leftLength = $pathCurrent.Length + 11
    $rightLength = $branch.Length + 12
    $points = "•" * ((Get-Host).UI.RawUI.WindowSize.Width - $leftLength - $rightLength)

    $colorPoints = "${esc}[90m $points ${escEnd}"
    $colorPathCurrent = "${esc}[30;102m 📂 ${pathCurrent} ${escEnd}"
    $colorBranch = "${esc}[88;44m ${branch} ${escEnd}"
    $colorNoBranch = "${esc}[30;102m  ${escEnd}"
    
    $customPrompt = "${curvaLeftTop} ${bgLeft}${bgLeftSecond}${bgLeftThird}${colorPathCurrent}${simbolStart}${colorPoints}"
    $customPrompt += if ($branch) {
        "${simbolEndWithBranch}${colorBranch}${bgRightThirdWithBranch}${bgRightSecondWithBranch}${bgRightWithBranch} ${curvaRightTop}`n`n"
    }
    else {
        "${simbolEnd}${colorNoBranch}${bgRightThird}${bgRightSecond}${bgRight} ${curvaRightTop}`n`n"
    }
    $customPrompt += " ${indicator} "

    "$customPrompt"
}

# PSReadLine Configs
Set-PSReadLineOption -ContinuationPrompt "$indicator "
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistoryNoDuplicates:$True
Set-PSReadLineOption -HistorySearchCursorMovesToEnd:$True
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -ShowToolTips:$True
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -ViModeIndicator Script
Set-PSReadLineOption -BellStyle Visual
Set-PSReadLineOption -Colors @{
    ContinuationPrompt = '#ffffff'
    Emphasis           = '#3ABAD0'
    ERROR              = '#FF3B18'
    Selection          = '#64FF59'
    Default            = '#ffffff'
    Comment            = '#ffffff'
    Keyword            = '#9D2CFF'
    String             = '#FFB230'
    Operator           = '#2FFF9F'
    Command            = '#64FF59'
    Variable           = '#A84FFF'
    Parameter          = '#F8FF39'
    Type               = '#AF0917'
    Number             = '#CA41FF'
    Member             = '#818CFF'
    InlinePrediction   = '#F8FF39'
}

# Autocompletion for arrow keys
Remove-PSReadLineKeyHandler -Key Ctrl+C
Remove-PSReadLineKeyHandler -Key Shift+Enter

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Ctrl+c, Ctrl+C -Function CancelLine
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+a, Ctrl+Shift+A -Function SelectAll
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+c, Ctrl+Shift+C -Function Copy
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+v, Ctrl+Shift+V -Function Paste 
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+l, Ctrl+Shift+L -Function RevertLine
Set-PSReadLineKeyHandler -Chord Ctrl+z, Ctrl+Z -Function Undo
Set-PSReadLineKeyHandler -Chord Ctrl+LeftArrow -Function BackwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+RightArrow -Function NextWord
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+Backspace -Function BackwardKillWord
Set-PSReadLineKeyHandler -Chord Ctrl+Enter -Function AddLine

# USER ALIAS
$userAlias = Join-Path $PSScriptRoot "\Modules\user-aliases\alias.ps1";
(Test-Path $userAlias && (. $userAlias)) >> $null


# JAVA VERSION MANAGER
if (-not $Global:JavaVersions) {
    $Global:JavaVersions = @{
        jdk8  = 'C:\Program Files\Java\jdk1.8.0_211'
        jdk11 = 'C:\Program Files\Microsoft\jdk-11.0.27.6-hotspot'
        jdk17 = 'C:\Program Files\Microsoft\jdk-17.0.15.6-hotspot'
        jdk22 = 'C:\Program Files\OpenJDK\jdk-22.0.2'
        jdk24 = 'C:\Program Files\Java\jdk-24'
    }
}
----------------------------------------------------------------------------------------------------------------------------------------------------------------

# POWERSHELL 5

#Configuration Autocompletion keys
Import-Module PSReadLine -RequiredVersion 2.3.6
Import-Module TrustedPlatformModule
# Import-Module MavenAutoCompletion -RequiredVersion 0.2
Import-Module -Name kmt.winget.autocomplete

# Código ASCII para escape
$esc = [char]0x1b
$escEnd = "$([char]0x1b)[0m"
# Simbolos
$curvaLeftTop = "${esc}[90m|-${escEnd}"
$curvaRightTop = "${esc}[90m-|${escEnd}"
$indicator = "${esc}[96m->${escEnd}"
# Cores esquerda
$simbolStart = "${esc}[30;42m ${escEnd}"
$bgLeftThird = "${esc}[37;42m ${escEnd}"
# Cores direita
$simbolEnd = "${esc}[88;44m ${escEnd}";
$bgRight = "${esc}[88;44m ${escEnd}"

# Customização do prompt
function prompt {
  $pathCurrent = Get-Location | Split-Path -Leaf
  $branch = if (git branch --show-current) { git branch --show-current } else { "" }
    
  $leftLength = $pathCurrent.Length + 6
  $rightLength = $branch.Length + 6
  $points = "-" * ((Get-Host).UI.RawUI.WindowSize.Width - $leftLength - $rightLength)

  $colorPoints = "${esc}[90m $points ${escEnd}"
  $colorPathCurrent = "${esc}[30;102m${pathCurrent}${escEnd}"
  $colorBranch = "${esc}[88;44m${branch}${escEnd}"
    
  $customPrompt = "${curvaLeftTop} ${bgLeftThird}${colorPathCurrent}${simbolStart}${colorPoints}"
  $customPrompt += if ($branch) { "${simbolEnd}${colorBranch}${bgRight} ${curvaRightTop}`n`n" } else { "${curvaRightTop}`n`n" }
  $customPrompt += " ${indicator} "

  "$customPrompt"
}

# PSReadLine Configs
Set-PSReadLineOption -ContinuationPrompt "> "
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -HistoryNoDuplicates:$True
Set-PSReadLineOption -HistorySearchCursorMovesToEnd:$True
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -ShowToolTips:$True
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -ViModeIndicator Script
Set-PSReadLineOption -BellStyle Visual
Set-PSReadLineOption -Colors @{
  ContinuationPrompt = '#ffffff'
  Emphasis           = '#3ABAD0'
  ERROR              = '#FF3B18'
  Selection          = '#64FF59'
  Default            = '#ffffff'
  Comment            = '#ffffff'
  Keyword            = '#9D2CFF'
  String             = '#FFB230'
  Operator           = '#2FFF9F'
  Command            = '#64FF59'
  Variable           = '#A84FFF'
  Parameter          = '#F8FF39'
  Type               = '#AF0917'
  Number             = '#CA41FF'
  Member             = '#818CFF'
  InlinePrediction   = '#F8FF39'
}

# Autocompletion for arrow keys
Remove-PSReadLineKeyHandler -Key Ctrl+C
Remove-PSReadLineKeyHandler -Key Shift+Enter

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Ctrl+c, Ctrl+C -Function CancelLine
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+a, Ctrl+Shift+A -Function SelectAll
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+c, Ctrl+Shift+C -Function Copy
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+v, Ctrl+Shift+V -Function Paste 
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+l, Ctrl+Shift+L -Function RevertLine
Set-PSReadLineKeyHandler -Chord Ctrl+z, Ctrl+Z -Function Undo
Set-PSReadLineKeyHandler -Chord Ctrl+LeftArrow -Function BackwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+RightArrow -Function NextWord
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+Backspace -Function BackwardKillWord
Set-PSReadLineKeyHandler -Chord Ctrl+Enter -Function AddLine

# USER ALIAS
$userAlias = Join-Path $PSScriptRoot "\Modules\user-aliases\alias.ps1";
if (Test-Path $userAlias) {
  . $userAlias
}
