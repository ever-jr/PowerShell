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

function Prompt {
	Show-Mage
	return " "
}

# disable completion
Set-PSReadLineOption -PredictionSource None

Invoke-Expression(&{ (zoxide init powershell | Out-String) })
