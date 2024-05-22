# OpenCore-HP-EliteDesk-800-G6

In this little guide, I'm trying to showcase how a fully working macOS hackintosh should look like while keeping a
backup for myself and a bug tracker.

## Specifications

CPU: i5-10500T

GPU: Intel UHD Graphics 630

RAM: 32GB DDR4 2133Mhz Hynix HMA82GS6MFR8N-TF

Chipset: Intel Q470 PCH-H– vPro

LAN: Intel I219-LM Gigabit Network Connection LOM (standard)

WI-FI/BT: BCM94360CS2 - Check Side Notes #3

SSD: KINGSTON SNV2S500G

Peripherals: Keychron K8 Pro and Logitech MX Master 3 for Mac

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
- Intel Software Guard: Disabled

Advanced:

- Boot options ->
    - Startup Delay ->
        - Fast boot: Enabled
        - USB Storage Boot: Enabled
        - Audio Alerts during boot: Enabled
        - UEFI Boot Order
            -
                1) OpenCore <--- must be first
- HP Sure Recover -> All disabled
- System Options ->
    - Turbo-Boost -> Enabled
    - Hyper threading -> Enabled
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
- FileVault - Check Side Notes #1
- WIFI/BT
- iMessage/Facetime - Check Side Notes #2
- CPU Power Management
- FAN Management
- Airdrop, Handoff.

## Not Working/Bugs

- Sleep
- Scrolling through Photo App sometimes will produce a kernel panic (did not happen in a while)

## How to use

1. Create the USB stick per [Dortania's Guide](https://dortania.github.io/OpenCore-Install-Guide/installer-guide/) and
   add the recovery image in case you didn't have macOS installed already.
2. Copy the EFI/ folder to your stick.
3. Make sure you have set the BIOS settings right.
4. Enjoy! (That means install macOS, you are on your own now.)

## Side Notes

1. FileVault is working, but I disabled it because I have a BT keyboard, and it won't load Bluetooth drivers or the USB
   ports unless you input the password.
2. I already had some Apple devices, so I didn't have to configure anything or it to work.
3. I had to replace the original WI-FI/BT card with a BCM94360CS2. I used
   a [12+6Pin Wireless WiFi Bluetooth Card to NGFF M.2 Key Adapter for macOS](https://www.ebay.com/itm/155877540201) for
   it to work.
   The original card was an Intel AX201NGW, which is supported but AirDrop and Handoff won't work or any other Apple
   quirks. You may wonder where to plug the antennas, well, I used the original ones, and it works just fine. 
   I also had to find a place for where to plug the USB, so I just plugged it in the back of the case. I used
   a [9pin USB Header to USB Cable USB 2.0 Type A Male to 9 Pin Male Motherboard Cable](https://www.ebay.com/itm/266202183302)
   and I sneaked the cable outside the case using the hole near the screw that holds the case together.

## P.S

Originally this EFI was taken from [Olarila](https://www.olarila.com/topic/30638-monterey-126-on-hp-prodesk-600-g6/).
All I did was update it to the latest version and fix my BT and WI-FI.
