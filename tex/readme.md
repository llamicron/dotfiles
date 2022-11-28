# Luke's LaTeX Templates
This directory contains template `.tex` files for Luke to use. Just copy any `.tex` file in the `templates/` directory and you're good to go.

Some templates use custom class files. Those will be in their own directory in `classes/`. For example, `notes.tex` references the custom class file `classes/notes.cls`.

# Compiling
Use `latexmk` to compile, open, and watch `.tex` files.

```
$ latexmk -pvc [your_file].tex
```

Note that some packages (`minted`, etc.) need the `-shell-escape` flag passed when running `latexmk`

## Automatically copy template

I wrote a script to do the work for you

```
$ newtex.sh
```

and follow the prompts.

