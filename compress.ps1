# net use X: \\aog-file01\is
$logfolders=("\\aog-file01\is\")
# $logfolders=("D:\Folder\One","D:\Folder\Two")
$age=(get-date).AddDays(-1825)

foreach ($logfolder in $logfolders) {
    Get-ChildItem -recurse $logfolder | where-object {$_.LastAccessTime -le $age -AND $_.Attributes -notlike "*Compressed*"} | 
    ForEach-Object {
    compact /C $_.FullName
#     echo found
    }
}