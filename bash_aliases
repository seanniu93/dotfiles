# Show list of all installed packages (Debian)
# Credit: StackOverflow
alias list_installed='dpkg --get-selections | grep -v deinstall'

# Move a file and leave a soft link in its place
# Credit: http://lifehacker.com/5270634/move-files-without-breaking-stuff
function lmv() {
    [ -e $1 -a -e $2 ] && mv $1 $2 && ln -s $2/$(basename $1) $(dirname $1);
}
