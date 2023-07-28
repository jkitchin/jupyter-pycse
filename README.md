# jupyter-starter
Base repository with jupyter lab devcontainer

You should probably not modify this repo with code files unless they are examples of how to use it. This intended as a template repository to start others.

# Features

## LaTeX with citations

See [citation example](./examples/citations.ipynb).

## Spreadsheet / tabular data editing

You can edit csv files in a spreadsheet like interface. See [csv example](./examples/read-write-csv.ipynb).

## Spell checker

A spell-checker is enabled. In Markdown cells, misspelled words will appear with a pink background. You can right click on them for suggested corrections. 

## PDF export via LaTeX and WebPDF

Jupyter lab is configured with PDF export either from LaTeX or webPDF. LaTeX looks nicer, but it is more fragile and not every LaTeX package is supported. webPDF may be more reliable. You export from the File -> Save and Export Nobebook As... menu.

## More batteries included

The base image is an Anaconda Python image. We add several additional packages and Jupyter lab configurations. See the [Dockerfile](./.devcontainer/Dockerfile) for details. For example, Jupyter Lab is set up to allow real-time collaborative editing by default.