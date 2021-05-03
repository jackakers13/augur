pause() {
    read -s -n 1 -p "$1"
    echo ""
}

installerVersion="1.0.0"

echo "Augur Setup Assistant (v$installerVersion)"
echo ""
pause "Press Any Key to Begin..."
echo ""

###########
# Phase 1 #
###########
echo "Beginning Phase 1 of 4 - Install Dependencies"
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
dependencies[0]="grep"
dependencies[1]="cat"
dependencies[2]="ls"
# Simulate a missing dependency
dependencies[3]="foo"

for currentCommand in "${dependencies[@]}"
    do ensure_command_is_present $currentCommand
done

echo ""
echo "Phase 1 Complete!"

###########
# Phase 2 #
###########
echo "Beginning Phase 2 of 4 - Setup Augur Database"
echo ""
echo "Phase 2 Complete!"

###########
# Phase 3 #
###########
echo "Beginning Phase 3 of 4 - Setup Augur Backend"
echo ""
echo "Phase 3 Complete!"

###########
# Phase 4 #
###########
echo "Beginning Phase 4 of 4 - Setup Augur Frontend"
echo ""
echo "Phase 4 Complete!"

echo ""
echo "Augur Installation Complete!"