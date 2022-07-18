# scoop install starship
# New-Item -Path $profile -Type File -Force
# notepad $PROFILE
# Invoke-Expression (&starship init powershell)
# oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\.mytheme.omp.json" | Invoke-Expression
Write-Host -NoNewline "`n`e[1F"
oh-my-posh init pwsh --config ~/.FirewallTheme.omp.json | Invoke-Expression


# Alias
Set-Alias grep findstr