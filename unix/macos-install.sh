#!/bin/bash

# The macOS Remote Desktop Protocol (RDP) client have Network Level
# Authentication (NLA) enabled. There are currently no method to disable
# NLA in the Graphic User Interface (GUI).
defaults write com.microsoft.rdc.macos ClientSettings.EnforceCredSSPSupport 0
