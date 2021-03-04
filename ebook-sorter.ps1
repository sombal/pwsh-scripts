Set-Location -Path "D:\OneDrive\Books\calibre"
$targetPath = "C:\Users\somba\Desktop\epub"
$fileType = "epub"
$books = Get-ChildItem . *.$fileType -Recurse
foreach ($book in $books) {
    $bookPath = "$($book.DirectoryName)\$($book.Name)"
    Copy-Item -Path $bookPath -Destination $targetPath
}