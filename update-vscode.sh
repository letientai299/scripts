#!/bin/bash
# Update vscode from downloaded deb file
url="https://go.microsoft.com/fwlink/?LinkID=760865"

rm -f /tmp/vscode.deb
curl -L $url > /tmp/vscode.deb
sudo dpkg --install /tmp/vscode.deb

exit 0
