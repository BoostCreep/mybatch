Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
	InitialDirectory = (Get-Location -PSProvider FileSystem).ProviderPath
    Multiselect = $true # Multiple files can be chosen
	
}
 
[void]$FileBrowser.ShowDialog()

$path = $FileBrowser.FileNames;

If($FileBrowser.FileNames -like "*\*") {

	# Do something before work on individual files commences
	$FileBrowser.FileNames #Lists selected files (optional)
	
	foreach($file in Get-ChildItem $path){
	Get-ChildItem ($file) |
		ForEach-Object {
            Set-ItemProperty -Path $path -Name IsReadOnly -Value $true
            compact /C $_.FullName
		}
	}
	# Do something when work on individual files is complete
}

else {
    Write-Host "Cancelled by user"
}