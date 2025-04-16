# open_tabs.ps1
# This script opens Windows Terminal with multiple tabs using absolute paths.
# The paths are built using the user’s home directory and a fixed project root location.

# Get the user home directory.
$userHome = $env:USERPROFILE

# Define the project root directory. Adjust "src" if your project is in a different folder.
$projectRoot = Join-Path -Path $userHome -ChildPath "src"

# Helper function to convert a relative path (from the project root) to an absolute path.
function Get-AbsolutePath($relativePath) {
    $fullPath = Join-Path -Path $projectRoot -ChildPath $relativePath
    # Use Resolve-Path to ensure we get the absolute path (this will throw an error if the path does not exist).
    return (Resolve-Path -Path $fullPath).Path
}

# Define an array of relative directories (paths relative to the project root)
$directories = @(
    "nexus-api\services\nexus-web-service",
    "nexus-api\services\direct-messaging-api",
    "nexus-api\services\direct-messaging-api",  # Duplicate for extra command tab
    "nexus\apps\mobile",
    "nexus\apps\web",
    "nexus\apps\web"
)

# Construct the Windows Terminal tab command for each directory.
$tabs = $directories | ForEach-Object {
    $absPath = Get-AbsolutePath $_
    "new-tab -d `"$absPath`""
}

# Join the tab commands with semicolons.
$wtArgs = $tabs -join " ; "

# Launch Windows Terminal with the constructed argument list.
Start-Process -FilePath "wt.exe" -ArgumentList $wtArgs -WorkingDirectory $env:USERPROFILE
