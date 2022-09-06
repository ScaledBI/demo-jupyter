#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

# file path of notebook as argument
readonly NOTEBOOK=$1

# start python http server in background and display the default index.html
python -m http.server 8000 &

# convert the jupyter file to index.html
jupyter nbconvert --to html --execute --ExecutePreprocessor.timeout=-1 --TemplateExporter.exclude_input=True --output-dir=./ --output index "$NOTEBOOK"

# wait for exit signals
wait -n
