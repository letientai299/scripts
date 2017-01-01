#!/bin/bash
# Update vscode from downloaded deb file
url="https://az764295.vo.msecnd.net/insider/ab491d3b40a99485eece2bff1ce8c4aa49aad913/code-insiders_1.9.0-1483081998_amd64.deb"

rm -f /tmp/vscode.deb
curl -L $url > /tmp/vscode.deb
sudo dpkg --install /tmp/vscode.deb

exit 0
