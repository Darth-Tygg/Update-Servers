#This script should get a list of Servers from Active Directory, then output the list to file, and then get Windows updates for them and install them.#

    #This section is where the Admin credentials are set.#
$username = "admin"
$password = "????"
$secstr = New-Object -TypeName System.Security.SecureString
$password.ToCharArray() | ForEach-Object {$secstr.AppendChar($_)}
$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $secstr

Get-ADComputer -Properties OperatingSystem -Filter {OperatingSystem -Like "Windows Server*"} | FT Name >C:\Users\admin\Desktop\Computers.txt
Pause
Get-WUInstall -Category "Security Updates, Critical Updates" -WindowsUpdate Software (Get-Content C:\Users\admin\Desktop\Computers.txt) -Credential company.com\$cred
Pause