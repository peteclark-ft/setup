# Mac OS X Developer Setup

Scripts to setup a new Mac from scratch.

## Command Line Tools

It installs:

* Homebrew
* Homebrew Cask
* Chef (which it then uses to manage config files)
* Java
* Go
* NGrok
* JQ
* Mutt
* Terraform
* DockUtil (cli for managing dock icons)
* Docker Toolbox

## Applications

Installs them via Homebrew Cask and adds them to the Dock (except Robomongo):

* Google Chrome
* Atom
* Intellij Community Edition
* Atlassian SourceTree
* Slack
* Robomongo

Additionally, it adds the following Apple apps to the dock:

* Mail
* Calendar
* Notes
* Reminders
* Terminal
* System Preferences

## OSX Preferences

The mac-preferences script sets up a number of OS X tweaks (showing hidden files, dock size etc.). See the in-line comments for more details.
