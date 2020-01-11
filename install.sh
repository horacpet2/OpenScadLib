#!/bin/sh

rm -R $HOME/.OpenSCadLib/

echo "Old library removed."

cp -r -f -v ../OpenSCadLib $HOME/.OpenSCadLib

echo "New library copied."
echo "Installation success."
