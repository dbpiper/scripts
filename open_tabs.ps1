# Save this as open_tabs.ps1
# This PowerShell script opens Windows Terminal with multiple tabs,
# each set to a specified working directory.

# Define an array with each Windows Terminal command for a new tab.
$tabs = @(
    'new-tab -d ".\src\nexus-api\services\nexus-web-service"',
    'new-tab -d ".\src\nexus-api\services\direct-messaging-api"',
    'new-tab -d ".\src\nexus-api\services\direct-messaging-api"',  # Duplicate for extra command tab
    'new-tab -d ".\src\nexus\apps\mobile"',
    'new-tab -d ".\src\nexus\apps\web"',
    'new-tab -d ".\src\nexus\apps\web"'
)

# Concatenate the commands with semicolons to form a single argument string.
$wtArgs = $tabs -join " ; "

# Start Windows Terminal with the constructed argument list.
Start-Process wt -ArgumentList $wtArgs
