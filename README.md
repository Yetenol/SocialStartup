# Automaticly launch and keep alive social apps

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

# Starting Windows 10 "Store App" from the command line

1. Run 
   ```
   shell:AppsFolder
   ```
1. Right click your app of choice and select `Create Shortcut`
1. Say `Yes`, to prompt to `place the shortcut on desktop`
1. Right click the shortcut and choose `Properties`
1. Open tab `Shortcut`
1. Make note of the entry in the **Target** field (ie _Microsoft.BingWeather_8wekyb3d8bbwe_) 
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
1. Copy and run **InstallLocation**
1. In that folder open `AppxManifest.xml`
1. Search the for `Executable=`
1. Make note of the entry `Application Id=` in the same line (ie _App_)
1. The command to launch the store app is

<pre>
explorer.exe shell:AppsFolder\<b>PackageFamilyName</b>!<b>Application Id</b>
</pre>

ie:

```
explorer.exe shell:AppsFolder\Microsoft.BingWeather_8wekyb3d8bbwe!App
```