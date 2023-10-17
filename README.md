# As of October 16th 2023 these scripts are no longer required. Please see [this post by Bouncyrock](https://bouncyrock.com/news/articles/talespire-patch-release-linux-out-of-box-experience) for more details. This repository is Archived.


# talespire-linux-uri
An installer script to Install and Setup an XDG-MIME for Talespire URIs

It is recommended you read below before installing!

**Paste this command in a terminal to get started:**
```bash
wget -N https://raw.githubusercontent.com/LividJava/talespire-linux-uri/main/tsxdg-setup.sh | bash
```

After running the script Open TaleSpire and run this in your terminal.
```bash
xdg-open talespire://dice/Test:1d20+5
```
This should add a dice to your screen and when you roll it, It should be called Test and be a d20.
<hr/>

#### **What is this?**
This script is simply an attempt to automatically add the Talespire URI Relay to xdg-mime, keeping it under the same proton prefix and version (At time of installation)

#### **Known Caveats**
If you have a non-standard installation, this script will break. It will do it's best to try to achieve agnostic installation.

If you've installed Vanilla Proton to the default install location, and TaleSpire somewhere else. This script will not work. You must manually edit the file after the script finishes.

#### **What does it do?**
It creates a `.desktop` file pointing to the `TaleSpireURIRelay.exe` executable, and runs it under the same prefix as TaleSpire. It will let you use `talespire://` URIs in Linux.

#### Microfixes
This script has some additional options for quickly fixing some minor errors, these are to be run post installation.

If you get an error about fsync run this command (assuming you didn't delete the script).
```bash
bash tsxdg-setup.sh fsync
```
Additionally, you can run with `esync` to restore the default values

<br/>

Huge thanks to Doskious, Adriannom who put this whole thing together! Massive thanks to Chairmander for being a RegEx Guru.
