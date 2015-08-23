# Clean up build and pbo folders
Get-ChildItem -Path ..\build -Include *.* -File -Recurse -Exclude @("README.md") | foreach { $_.Delete()}
Get-ChildItem -Path ..\pbo -Include *.* -File -Recurse -Exclude @("builds.txt") | foreach { $_.Delete()}

# Make the build directory with only valid files from branch
$from = '..\'
$to = '..\build'

Get-ChildItem -Path $from | % { 
  Copy-Item $_.fullname "$to" -Recurse -Force -Exclude @("build","pbo","tools", "A3M PMC Sandbox.docx",".gitattributes") 
}

# Create the pbo file from the build directory
makepbo -NUP ..\build .\pbo\a3m-pmc-simulator.pbo
