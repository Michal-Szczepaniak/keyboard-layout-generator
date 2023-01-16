# Keyboard layout generator
This software is used to generate optimum layout from logged keys. It has configurable key importance and uses [logkeys](https://github.com/kernc/logkeys) to log keys.

# Requirements
You need nim and logkeys. To compile it run

```nim c main.nim```

Before you can generate anything you have to log what keys you press over extended period of time. To do that, run 

```logkeys -o /var/log/logkeys.log --no-daemon --no-timestamps --no-func-keys```

either as root or as user. After enough data is gathered you can proceed to use this software. Needed period is unknown, the longer you do the more correct data will become, but it has diminishing returns.

# Usage
Inside `key-ordering.json` is json array that represents how easy, each key, is to press. Starting from 1 to 30. Most common key will be placed in spot of number `1` and least used key will be placed in spot of number `30`. You can adjust it as you please but do not make duplicates.

Place your log in same directory with name `logkeys.log`. 

Then run software using `./main`. It should create file `output.json` with generated layout. If you make newline every 10 characters it will be easier to understand.

Enjoy your wicked but perfectly optimized layout :)