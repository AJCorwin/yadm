# scoop install starship
# New-Item -Path $profile -Type File -Force
# notepad $PROFILE
# Invoke-Expression (&starship init powershell)
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\.mytheme.omp.json" | Invoke-Expression
Import-Module oh-my-posh
& "$env:LOCALAPPDATA\Programs\oh-my-posh\bin\oh-my-posh.exe" ~/.FirewallTheme.omp.json | Invoke-Expression
