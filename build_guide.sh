#! /bin/bash
# Script to build the glossary using ccutil

CURRENT_GUIDE="Glossary of Terms and Conventions for Product Documentation"
CURRENT_DIRECTORY=$(pwd)
RED='\033[0;31m'

# Remove the build directory to start fresh
if [ -d build ]; then
   rm -r build/
fi

echo ""
echo "************************************************************************"
echo "* Building $CURRENT_GUIDE *"
echo "************************************************************************"
echo ""

# Command to build the guide using ccutil
ccutil compile --lang en_US --format html-single --main-file master.adoc --open

# Check whether the build was successful
if [ -d  $CURRENT_DIRECTORY/build/tmp/en-US/html-single/ ]; then
  echo ""
  echo "$CURRENT_GUIDE is located at: "
  echo file://$CURRENT_DIRECTORY/build/tmp/en-US/html-single/index.html
  echo ""
  exit 0
else
  echo ""
  echo -e "${RED}Build of $CURRENT_GUIDE failed! \e[0m"
  echo -e "${RED}See the log above for details. \e[0m"
  echo ""
  exit 1
fi
