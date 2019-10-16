#Connect to Exchange Server with Remote Powershell
$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session -DisableNameChecking


#Change The format
Set-MailContact support@solidpe.maxdesk.us -UseMapiRichTextFormat Never

Set-MailContact -Identity support@solidpe.maxdesk.us -UsePreferMessageFormat $true

#Confirm the change has been made
Get-MailContact | Select support@solidpe.maxdesk.us | Select UseMapiRichTextFormat


Remove-PSSession $Session