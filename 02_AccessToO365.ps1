## Office365 への接続

$orgName="dondoco01"
$credential = Get-Credential
Connect-MsolService -Credential $credential


## Exchange Online への接続　※セッションは最後に必ず切断すること
$exchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri "https://outlook.office365.com/powershell-liveid/" -Credential $credential -Authentication "Basic" -AllowRedirection
Import-PSSession $exchangeSession -DisableNameChecking
## インポートしたコマンドの確認
Get-Command -Module tmp_jp4o4bs0.bme

## Sharepoint Online への接続　※セッションは最後に必ず切断すること
Import-Module -Name Microsoft.Online.SharePoint.PowerShell -DisableNameChecking
Connect-SPOService -Url https://$orgName-admin.sharepoint.com -credential $credential
## インポートしたコマンドの確認
Get-Command -Module Microsoft.Online.SharePoint.PowerShell

## Skype Online への接続　※セッションは最後に必ず切断すること
Import-Module SkypeOnlineConnector
$sfboSession = New-CsOnlineSession -Credential $credential
Import-PSSession $sfboSession

## セキュリティ/コンプライアンスセンター への接続　→　これはうまくいかない
$SccSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.compliance.protection.outlook.com/powershell-liveid/ -Credential $credential -Authentication Basic -AllowRedirection
Import-PSSession $SccSession -Prefix cc

## Teams への接続　※セッションは最後に必ず切断すること
Connect-MicrosoftTeams

## Azure AD v2 PowerShell への接続
Connect-AzureAD -Credential $UserCredential

## セッションの切断
Remove-PSSession $sfboSession
Remove-PSSession $exchangeSession
Remove-PSSession $SccSession
Disconnect-SPOService