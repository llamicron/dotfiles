#!/usr/bin/sh

# This script copies one of Luke's custom .tex files as a template into the working directory and opens it
# It's just a shortcut to get things up and running quickly

NT_TEMPLATE_DIR="/home/llamicron/usr/tex/templates/"

echo "Creating a .tex template"
tree -L 1 $NT_TEMPLATE_DIR | grep .tex
echo -n "Which template do you want (w/o .tex)? "
read NT_TEMPLATE_NAME

NT_TEMPLATE="$NT_TEMPLATE_DIR$NT_TEMPLATE_NAME.tex"

if [ -f $NT_TEMPLATE ]; then
    echo "Copied template. Opening..."
    cp $NT_TEMPLATE .
    code .
    latexmk -pvc
else
    echo "Couldn't find that template."
    exit 1
fi 
