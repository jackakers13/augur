# Augur Install Script: Design Document
## Purpose:
To validate the installation environment, identify missing dependencies, and automate/guide the install process to the greatest degree possible.
## Restrictions:
1) Must run from the command-line (No GUI) to ensure support for server deployments
2) Must run on Linux
3) Must not require any dependecies that cannot be reasonably expected to already be present in a standard deployment environment
## Format:
Shell Script - addresses all restrictions, capable of handling the use case, and uses a widely-known language for maintainability and new user comprehension. Comes with the added benefit of not having to be compiled, so can be cleanly integrated into the repo and be immediately runnable by the user.
## Design:
The script execution will ocur in a sequence of discrete, linear phases:
1) Dependency Checking
2) Database Setup
3) Backend Setup
4) Frontend Setup (Optional)

Ideally, it should be possible to jump to a specified phase using a command line parameter to bypass already completed steps. It should also be possible to opt out of the frontend install. All available options are to be echoed to the console prior to execution.

The Dependency Checking Phase will identify missing dependencies for ALL other phases before attempting them (with the obvious exception of frontend, if it is disabled). By resolving these ahead of time, we can avoid error handling later in the process. The user will be presented with a list of all dependencies, shown which are missing, and given instructions on how to resolve the dependency where possible and necessary.

The following phases will run the appropriate commands to setup and start their respective Augur modules. This phase would ideally correspond with a command line option to choose between Docker and Native installations, but this may prove to be outside the scope of this excercise.
## Likely Challenges:
Identifying all of Augur's dependencies and testing for compatible versions is not a trivial task. Many are obvious, but when dependencies themselves have dependencies which themselves have dependencies etc., the process could get quite messy. My current theory for addressing this is to run the script offline, meaning that any missing dependecies will cause an error which may then be identified and added to the script. If a dependency is installed automatically (such as when using `sudo apt-get`), then it is not necessary for us to check for it here. Version checking will be necessarily approximate for the maintainability of the script, but some common-sense checks can still be implemented (ex. Python 2 installed instead of Python 3).

Another potential issue is addressing the flexibility of Augur and its varied installation methods and configurations. The use case for this tool is to expand the accessibility of the software and to serve as a convenience, so outside of basic customizations (such as Docker vs. Native, disabling frontend, etc.) I don't intend to be overly permissive. Manual installations are of course still available, and users who require those advanced options will likely choose to go that route regardless.