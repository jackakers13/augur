pause() {
    read -s -n 1 -p "$1"
    echo ""
}

installerVersion="1.0.0"

echo "Augur Setup Dependency Assistant (v$installerVersion)"
echo ""
pause "Press Any Key to Begin..."
echo ""

###########
# Phase 1 #
###########
echo "Beginning Phase \"Ensure Dependencies\""
echo ""

command_is_present() {
    command -v $1 >/dev/null 2>&1 || { return 1; }
    return 0
}
ensure_command_is_present() {
    while ! command_is_present "$1";
        do echo "Required Dependency \"$1\" is Not Present!"; pause "Install the Missing Dependency, Then Press Any Key to Retry the Test...";
    done
    echo "Required Dependency \"$1\" is Present!"
}

declare -a dependencies
dependencies[1]="python"
dependencies[2]="pip"
dependencies[3]="flask"
dependencies[4]="psql"
dependencies[5]="node"
dependencies[6]="npm"
dependencies[7]="vue" # Ensures both Vue.js and Vue CLI
dependencies[8]="make"

for currentCommand in "${dependencies[@]}"
    do ensure_command_is_present $currentCommand
done

echo ""
echo "Phase \"Ensure Dependencies\" Complete!"

##############################################################
# Setup Phases, Defer to Existing Python Installation Script #
##############################################################
echo ""
echo "Finished Dependency Checking, Ready to Run 'python setup.py install'"
pause "Press any key to automatically run setup.py..."
python setup.py install
