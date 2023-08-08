#Configuration Autocompletion keys
Import-Module PSReadLine -RequiredVersion 2.2.6

Set-PSReadLineOption -ContinuationPrompt '->'
Set-PSReadLineOption -PromptText '->'
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
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+a, Ctrl+Shift+A -Function SelectAll
Set-PSReadLineKeyHandler -Chord Ctrl+Shift+l, Ctrl+Shift+L -Function RevertLine
Set-PSReadLineKeyHandler -Chord Ctrl+LeftArrow -Function BackwardWord
Set-PSReadLineKeyHandler -Chord Ctrl+RightArrow -Function NextWord
Set-PSReadLineKeyHandler -Chord Ctrl+Enter -Function AddLine


# User Alias
. $PSScriptRoot\Modules\user-aliases\alias.ps1
