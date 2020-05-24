#!/bin/bash

#Script inserts an file snippet to a file after a specific line
ORIGINAL_FILE=original.xml
EXTENSION_FILE=extension.xml
TARGET_NODE="<\/book>"

#Mark the first occurrence of target node
sed -i "0,/${TARGET_NODE}/s/${TARGET_NODE}/target_node/" ${ORIGINAL_FILE}
#Insert file content
sed -i "/target_node/ r extension.xml" ${ORIGINAL_FILE}
#Restore maker
sed -i "s/target_node/${TARGET_NODE}/" ${ORIGINAL_FILE}

#Print file content
cat ${ORIGINAL_FILE}