# OpenCore-HP-EliteDesk-800-G6

In this little guide I'm trying to showcase how a fully working macOS hackintosh should look like while keeping a backup for myself and a bug tracker.

## Specifications

CPU: i5-10500T

GPU: Intel UHD Graphics 630

RAM: 32GB DDR4 2133Mhz Hynix HMA82GS6MFR8N-TF

Chipset: Intel Q470 PCH-H– vPro

LAN: Intel I219-LM Gigabit Network Connection LOM (standard)

WIFI/BT: AX200 for WIFI and ASUS-BT400 for Bluetooth (check SideNotes #1)

SSD: KINGSTON SNV2S500G

Peripherials: Keychron K8 Pro and Logitech MX Master 3 for Mac

Monitors: DELL U2717D (DP) + LG 34WL85C-B (HDMI)

Additional: 1 HDMI port + 2 USB ports extensions

BIOS Version: not sure, will update later

## Versions

OpenCore: 0.9.8

Last Update of EFI: 11/02/2024

Tested on: macOS Ventura Version 13.6.4 (22G513)

## Bios Settings

Security: 
- TPM Embedded -> TPM Device: Enabled
- BIOS Sure Start -> All disabled, just "Dynamic Runtime Scanning of Boot Block" checked
- Secure Boot -> All disabled
- Intel Software Guard : Disabled

Advanced:
- Boot options ->
  - Startup Delay ->
    - Fast boot: Enabled
    - USB Storage Boot: Enabled
    - Audio Alerts during boot: Enabled
    - UEFI Boot Order
      -  1) OpenCore <--- must be first
- HP Sure Recover -> All disabled
- System Options ->
  - Turbo-Boost -> Enabled
  - Hyperthreading -> Enabled
  - VTx -> Enabled
  - VTd -> Disabled
- Built-IN Devices -> 
  - Embedded LAN Controller: Enabled
  - Audio Device: Enabled
  - Internal Speakers: Enabled
  - M2 USB/Bluetooth: Enabled
  - Video Memory Size: 512Mb

Check the photos in the bios_settings for the exact settings.

## Working/Features

- The Fancy Boot Picker
- EFI Boot entry hidden
- FileVault - Check Side Notes #2
- WIFI/BT
- iMessage/Facetime - Check Side Notes #3
- CPU Power Management
  
## Not Working/Bugs

- Sleep
- Sometimes Bluetooth peripherials get randomly disconnected.
- Scrolling through Photos App sometimes will produce a kernel panic

## How to use

1. Create the USB stick per [Dortania's Guide](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/) and add the recovery image in case you didn't have macOS installed already.
2. Copy the EFI/ folder to your stick.
3. Make sure you have set the BIOS settings right.
4. Enjoy! (That means install macOS, you are on your own now.)

## Side Notes

1. The EliteDesk comes pre-installed with a AX201 most of the time, but since Bluetooth is quite troublesome in general for Hackintosh you must disable it, but surprise, you cannot disable Bluetooth on this card so you are forced to buy a AX200 card and then go to BIOS and disable BlueTooth.
2. FileVault is working but I disabled it because I have a BT keyboard and it won't load Bluetooth drivers or the USB prorts unless you input the password.
3. I already had some Apple devices so I didn't have to configure anything or it to work.

## P.S

Originally this EFI was taken from [Olarila](https://www.olarila.com/topic/30638-monterey-126-on-hp-prodesk-600-g6/). All I did was update it to the latest version and fix my BT and WIFI.
