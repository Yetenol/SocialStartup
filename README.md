# Starting Windows 10 "Store App" from the command line

1. Run 
   ```
   shell:AppsFolder
   ```
1. Right click your app of choice and select `Create Shortcut`
1. Say `Yes`, to prompt to `place the shortcut on desktop`
1. Right click the shortcut and choose `Properties`
1. Open tab `Shortcut`
1. Make note of the first part in the **Target** field (_PackageFamilyName_ **!** _ApplicationID_)
   * ie: `Microsoft.BingWeather_8wekyb3d8bbwe`!App
1. Open **Windows Powershell** or run 
   ```
   powershell
   ```
1. Run commands 
   ```
   get-appxpackage > applist.txt
   start applist.txt
   ```

1. Search the file for the **Target** name
1. Locate and make note of the **PackageFamilyName**
1. Navigate to **InstallLocation**
1. In that folder open `AppxManifest.xml`
1. Search the for `Executable=`
1. Make note of the entry `Application Id=` in the same line (ie _App_)
1. The command to launch the store app is

<pre>
explorer.exe shell:AppsFolder\<i>PackageFamilyName</i>!<i>ApplicationID</i>
</pre>

* ie: explorer.exe shell:AppsFolder\Microsoft.BingWeather_8wekyb3d8bbwe!App

# Create a custom named shortcut

1. Create a *script.bat* skript and paste in the start command
   * ie explorer.exe shell:AppsFolder\Microsoft.Office.OneNote_8wekyb3d8bbwe!microsoft.onenoteim
1. Run 
```
iexpress.exe
```
* or start C:\Windows\System32\iexpress.exe

1. Fill out the wizard  window
   * Select _Create new Self Extraction Directive File_ > `Next`
   * Select _Extract files and run an installation command_ > `Next`
   * Name the package > `Next`
   * Select _No prompt_ > `Next`
   * Select _Do not dialog a license_ > `Next`
   * Add your skript as a package file > `Next`
   * Set Install Program command to 
   ```
   cmd /c script.bat
   ```
   * \> `Next`
   * Select _Hidden_ > `Next`
   * Select _No message_ > `Next`
   * Select _Hide File Extracting Progress Animation from User_
   * Choose output path > `Next`
   * Select _No restart_ > `Next`
   * Select _Don't save_ > `Next`
   * `Next`
   * `Finish`
1. Create a shortcut for the executable
1. Edit its name and icon

# Automaticly launch and keep social apps alive

1. Open **Task Scheduler** or run 
   ```
   taskschd.msc
   ```
1. Right click `Task Scheduler Library` and select `New Folder...`
1. Enter the name `Social Startup` and press `OK`
1. Open subfolder `Social Startup`
1. Select `Action`>`Import Task...`
1. Import all `.xml` files
1. Copy all `.bat` files to `C:\Windows\System32` or to any `PATH` location
1. Restart the computer to run tasks