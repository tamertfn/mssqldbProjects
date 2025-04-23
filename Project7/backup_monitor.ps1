# === AYARLAR ===
$webhookUrl = "https://outlook.office.com/webhook/..."  # Bu alana teamswebhook girilir ancak elimde olmadigi icin gerekli test ortamini hazirlayamadim.
$connectionString = "Server=secret;Database=BackupMonitor;Integrated Security=True;"
$databaseToCheck = "AdventureWorks2022"

# SQL sorgusu: son backup kaydını al
$query = @"
SELECT TOP 1 *
FROM BackupLog
WHERE DatabaseName = '$databaseToCheck'
ORDER BY BackupStart DESC
"@

# SQL Server modülü yüklü olmalı
Import-Module SqlServer

try {
    $result = Invoke-Sqlcmd -ConnectionString $connectionString -Query $query

    if ($result.Status -eq 'Success') {
        $text = @"
✅ Yedekleme başarılı

📅 Tarih: $($result.BackupStart)
📁 Dosya: $($result.BackupPath)
💾 Boyut: $($result.BackupSize) MB
📘 Tip: $($result.BackupType)
"@
        $color = "28A745"  # Yeşil
    }
    else {
        $text = @"
⚠️ Yedekleme başarısız

📅 Tarih: $($result.BackupStart)
📘 Tip: $($result.BackupType)
📁 Dosya: $($result.BackupPath)
❌ Hata: $($result.ErrorMessage)
"@
        $color = "FF0000"  # Kırmızı
    }
}
catch {
    $text = "❌ PowerShell hata verdi: $($_.Exception.Message)"
    $color = "FF0000"
}

# === TEAMS MESAJINI GÖNDER ===
$payload = @{
    "@type" = "MessageCard"
    "@context" = "http://schema.org/extensions"
    "summary" = "SQL Backup Raporu"
    "themeColor" = $color
    "sections" = @(
        @{
            "activityTitle" = "🎯 AdventureWorks Backup Raporu"
            "text" = "```\n$text\n```"
        }
    )
} | ConvertTo-Json -Depth 10

Invoke-RestMethod -Uri $webhookUrl -Method Post -Body $payload -ContentType 'application/json'
