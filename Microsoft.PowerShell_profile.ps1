#function nvim_fuzzy_find {
#  nvim $(fzf)
#}

function Get-GitBranch {
	$branchName = ""
	if (Test-Path .git) {
		$gitBranch = git branch --show-current 2>$null
		if ($gitBranch) {
			$branchName = " ($gitBranch)"
		}
	}
	return $branchName
}

function Show-Mage {
	$branch = Get-GitBranch

	Write-Host "  /･\ " -ForegroundColor Magenta -NoNewLine
	Write-Host $PWD -ForegroundColor DarkGray
	Write-Host "_/･ﾟ｡\__" -ForegroundColor Magenta
    Write-Host "(∩｀-´)⊃━" -ForeGroundColor Blue -NoNewLine
	Write-Host "☆ﾟ$branch.*･｡ﾟ" -ForegroundColor Yellow -NoNewLine
}

function Show-Mage2 {
    #$user = $env:USERNAME
    #$path = (Get-Location) -replace "C:", ""
    #$path = $path -replace "\\", "/"
    #$path = $path -replace "/Users/$user", "~"
	$branch = Get-GitBranch

	Write-Host "  / \ " -ForegroundColor Magenta -NoNewLine
	Write-Host $PWD -ForegroundColor Yellow
	Write-Host "_/   \__" -ForegroundColor Magenta
	#Write-Host "(∩｀-´)⊃━☆ﾟ.*･｡ﾟ $branch" -ForegroundColor Blue -NoNewLine
    Write-Host "(∩｀-´)⊃━☆ﾟ$branch.*･｡ﾟ" -ForegroundColor Blue -NoNewLine
}

function Prompt {
	Show-Mage
	return " "
}

# disable completion
Set-PSReadLineOption -PredictionSource None

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Invoke-Expression(&{ (zoxide init powershell | Out-String) })

# ALIASES
#New-Alias -Name n -Value nvim
#New-Alias -Name nf -Value nvim_fuzzy_find
