# talespire-linux-uri
An installer script to Install and Setup an XDG-MIME for Talespire URIs

It is recommended you read below before installing!

**Paste this command in a terminal to get started:**
```
wget -N https://raw.githubusercontent.com/LividJava/talespire-linux-uri/main/tsxdg-setup.sh && bash tsxdg-main.sh
```

**What is this?**
<br/>
This script is simply an attempt to automatically add the Talespire URI Relay to xdg-mime, keeping it under the same proton prefix and version (At time of installation)

**Known Caveats**
<br/>
If you have a non-standard installation, this script will break. It will do it's best to try to achieve agnostic installation.

If you've installed Vanilla Proton to the default install location, and TaleSpire somewhere else. This script will not work. You must manually edit the file after the script finishes.

If your Wineprefix starts with FSYNC rather than ESYNC you will need to change this post installation.

**What does it do?**
<br/>
It creates a `.desktop` file pointing to the `TaleSpireURIRelay.exe` executable, and runs it under the same prefix as TaleSpire. It will let you use `talespire://` URIs in Linux.

Huge thanks to Doskious, Adriannom who put this whole thing together! Massive thanks to Chairmander for being a RegEx Guru.