# talespire-linux-uri
An installer script to Install and Setup an XDG-MIME for Talespire URIs

It is recommended you read below before installing!

**Paste this command in a terminal to get started:**
```
wget -N https://raw.githubusercontent.com/LividJava/talespire-linux-uri/main/tsxdg-main.sh && bash tsxdg-main.sh
```

**What is this?**
<br/>
This script is simply an attempt to automatically add the Talespire URI Relay to xdg-mime, keeping it under the same proton prefix and version (At time of installation)

**Known Caveats**
<br/>
This installation script assumes that you are using a Native steam installation, along with Default installation path for both Steam and Talespire. (Everything is installed in ~/.local/share/Steam)

This is really for someone who is using linux and just wants to get up and running without messing about with a terminal/config files.

**What does it do?**
<br/>
It first tests for a common mixup when the files were conceptuallized by Doskious and Adriannom, then tries to fix it to what MIME is looking for.

If not one is found, it then proceeds onto the next script, that creates and sets up the actual files.

Huge thanks to Doskious and Adriannom who put this whole thing together!