#!/bin/bash
cd /home/container

# Output Current Java Version
java -version

# Output Current Python Version
python3 --version
pip3 --version

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
${MODIFIED_STARTUP}