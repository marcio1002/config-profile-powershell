
function yarnWithArgs {yarn $args}

function yarnExecDev { yarn dev }

function ArtisanWithArgs { php artisan $args }

New-Alias -Name y -Value yarnWithArgs -Option AllScope
New-Alias -Name yd -Value yarnExecDev -Option AllScope
New-Alias -Name c -Value composer -Option AllScope
New-Alias -Name artisan -Value ArtisanWithArgs -Option AllScope