## Installing the x42 UI on the Raspberry Pi

### Tested OS's
    Raspbian Stretch
    
    *results on non-tested operating systems may vary*

Step 1. 

    Download the x42.Core-v0.1.8-linux-armv7l.deb file from [here](https://github.com/x42protocol/X42-FullNode-UI/releases)
    
    or
    
    In a terminal run
    
    ```wget https://github.com/x42protocol/X42-FullNode-UI/releases/tag/v0.1.8/x42.Core-v0.1.8-linux-armv7l.deb```

Step 2.

    In a terminal run 
    
    ```sudo dpkg --add-architecture armv7l```
    
    to make sure that the package manager can unpack the armv7l architecture.
    
Step 3.

    Run 
    
    ```sudo dpkg -i x42.Core-v0.1.8-linux-armv7l.deb```
        
Enjoy.
