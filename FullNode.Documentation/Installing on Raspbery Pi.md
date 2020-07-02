## Installing the x42 UI on the Raspberry Pi

### Tested OS's
1. Raspbian Stretch
    
*results on non-tested operating systems may vary*

#### Step 1. 

Using your browser, Download the x42.Core-v0.1.19-linux-armv7l.deb file from [here](https://github.com/x42protocol/X42-FullNode-UI/releases)

*NOTE: wget and curl have been seen to cause issues with the file download*

#### Step 2.

In a terminal run     
```sudo dpkg --add-architecture armv7l```
    
to make sure that the package manager can unpack the armv7l architecture.
    
#### Step 3.

In a terminal run     
```sudo dpkg -i x42.Core-v0.1.19-linux-armv7l.deb```
        
Enjoy.
