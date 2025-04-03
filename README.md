# Win11ActivateAdmin

A quick and dirty PowerShell script that activates the "Administrator" account on your Windows 11 device.

## How it Works

This script enables the built-in "Administrator" account on your Windows 11 machine. By default, this account is disabled for security reasons. However, there are scenarios where you might need to activate it, such as troubleshooting or performing system administration tasks that require elevated privileges.

## Troubleshooting

### If PowerShell Denies Permission

If you encounter permission issues when running the script, you may need to change your PowerShell Execution Policy to either `RemoteSigned` or `Unrestricted`. Follow the steps below:

1. Open PowerShell as an Administrator.
2. Run the following command to set the execution policy to `RemoteSigned`:
    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
    ```
    or, to set it to `Unrestricted`:
    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force
    ```
3. Try running the script again. It should now work as intended.

By setting the execution policy to `RemoteSigned`, you allow PowerShell to run scripts that are created locally or downloaded from the internet, provided they are signed by a trusted publisher. Setting it to `Unrestricted` allows all scripts to run without any restrictions, but it is less secure.
