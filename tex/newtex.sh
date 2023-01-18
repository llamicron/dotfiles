#!/usr/bin/sh

# This script copies one of Luke's custom .tex files as a template into the working directory and opens it
# It's just a shortcut to get things up and running quickly

NT_TEMPLATE_DIR="/home/llamicron/etc/tex/templates/"

echo "Creating a .tex template"
tree -L 1 $NT_TEMPLATE_DIR | grep .tex
echo -n "Which template do you want (w/o .tex)? "
read NT_TEMPLATE_NAME
echo -n "Name (no spaces)? "
read NT_DOCUMENT_NAME

NT_TEMPLATE="$NT_TEMPLATE_DIR$NT_TEMPLATE_NAME.tex"

if [ -f $NT_TEMPLATE ]; then
    echo "Creating document directory..."
    mkdir $NT_DOCUMENT_NAME
    echo "Copied template. Opening..."
    # NT_DOCUMENT_NAME should be the name of the directory and the name of the .tex file
    # ie. 1_17_intro_to_HCI/1_17_intro_to_HCI.tex
    cp $NT_TEMPLATE "$NT_DOCUMENT_NAME/$NT_DOCUMENT_NAME.tex"
    code $NT_DOCUMENT_NAME
else
    echo "Couldn't find that template."
    exit 1
fi 
