## POWERSHELL 7

#Configuration Autocompletion keys
Import-Module PSReadLine -RequiredVersion 2.3.6
Import-Module TrustedPlatformModule
Import-Module Az.Tools.Predictor
Import-Module MavenAutoCompletion -RequiredVersion 0.2
Import-Module -Name Microsoft.WinGet.CommandNotFound

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
$bgRight = "${esc}[92;42m░${escEnd}"
$bgRightSecond = "${esc}[32m▒${escEnd}"

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


# Customização do prompt
function prompt {
    $pathCurrent = Get-Location | Split-Path -Leaf
    $branch = git branch --show-current 
    $leftLength = $pathCurrent.Length + 11
    $rightLength = $branch.Length + 11
    $points = "•" * ((Get-Host).UI.RawUI.WindowSize.Width - $leftLength - $rightLength)

    $colorPoints = "${esc}[90m $points ${escEnd}"
    $colorPathCurrent = "${esc}[30;102m 📂 $pathCurrent ${escEnd}"
    $colorBranch = "${esc}[30;1;102m $branch ${escEnd}"

    
    $customPrompt = "${curvaLeftTop} ${bgLeft}${bgLeftSecond}${bgLeftThird}${colorPathCurrent}${simbolStart}${colorPoints}"
    $customPrompt += "${simbolEnd}${colorBranch}${bgRight}${bgRightSecond} ${curvaRightTop}`n`n"
    $customPrompt += " ${indicator} "

    "$customPrompt"
}

# USER ALIAS
(Test-Path "$PSScriptRoot\Modules\user-aliases\alias.ps1" && (. "$PSScriptRoot\Modules\user-aliases\alias.ps1")) >> $null
----------------------------------------------------------------------------------------------------------------------------------------------------------------

# POWERSHELL 5

#Configuration Autocompletion keys
Import-Module PSReadLine -RequiredVersion 2.3.6
Import-Module TrustedPlatformModule

Set-PSReadLineOption -ContinuationPrompt "$indicator "
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


# Customização do prompt
function prompt {
    $pathCurrent = Get-Location | Split-Path -Leaf

    $customPrompt += "$pathCurrent > "

    "$customPrompt"
}
