# テナントのライセンス SKU に何があるのか確認
Get-MsolAccountSku | Format-List AccountSkuId

# 個別のライセンスに何があるのか確認
Get-MsolAccountSku | Where-Object {$_.SkuPartNumber -eq 'ENTERPRISEPREMIUM'} | ForEach-Object {$_.ServiceStatus} 


