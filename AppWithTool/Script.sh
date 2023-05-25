#!/bin/sh


# Initialize global variables.
{
  declare SCRIPT_INVOKED_NAME="${BASH_SOURCE[${#BASH_SOURCE[@]}-1]}"
  ##export  SCRIPT_INVOKED_NAME
  declare SCRIPT_NAME="${SCRIPT_INVOKED_NAME##*/}"
  ##export  SCRIPT_NAME
  declare SCRIPT_INVOKED_PATH="$( dirname "${SCRIPT_INVOKED_NAME}" )"
  ##export  SCRIPT_INVOKED_PATH
  declare SCRIPT_PATH="$( cd "${SCRIPT_INVOKED_PATH}"; pwd )"
  ##export  SCRIPT_PATH
  declare SCRIPT_RUN_DATE="$( date +%s )"
  ##export  SCRIPT_RUN_DATE
  
  echo "\nSCRIPT_INVOKED_NAME="$SCRIPT_INVOKED_NAME
  echo "SCRIPT_NAME="$SCRIPT_NAME
  echo "SCRIPT_INVOKED_PATH="$SCRIPT_INVOKED_PATH
  echo "SCRIPT_PATH="$SCRIPT_PATH
  echo "SCRIPT_RUN_DATE="$SCRIPT_RUN_DATE
  echo "\n"

ls $SCRIPT_INVOKED_PATH;echo "\n"
open $SCRIPT_INVOKED_PATH/SanJuanGoddess.jpg
$SCRIPT_INVOKED_PATH/./ToolX

}

## echo "Script.sh"
## echo "\$(PWD)="$(PWD)
## echo "/Users/"$(whoami)"/Library/Containers/dev.bitcoincore.AppWithTool/Data"

## type -P bash
## type -P ls && ls /bin && echo `pwd`

addpath(){
export PATH=$PATH:$(PWD)
export PATH=$PATH:/Volumes/git/AppWithTool/Build/Products/Debug/
export PATH=$PATH:$SCRIPT_INVOKED_PATH
echo $PATH
}

list(){

ls Desktop
echo "\nDocuments:"
ls Documents
echo "\nDownloads:"
ls Downloads
open Downloads/SanJuanGoddess.jpg
echo "\nLibrary:"
ls Library
echo "\nMovies:"
ls Movies
echo "\nMusic:"
ls Music
echo "\nPictures:"
ls Pictures
open Pictures/Photos\ Library.photoslibrary


}

ls $(PWD)

echo "DEBUG="$DEBUG

if [ DEBUG ];then
    addpath;
else
    echo
fi
