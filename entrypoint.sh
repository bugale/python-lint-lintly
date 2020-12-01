#!/usr/bin/env bash

if [ "$INPUT_USE_PYLINT" != "" ] ; then
    cat $INPUT_USE_PYLINT | xargs -n 1 pip3 install -U
fi

if [ "$INPUT_USE_PYLINT" = true ] ; then
    pylint $INPUT_EXTRA_PYLINT_OPTIONS --output-format=json | lintly --format=pylint-json --api-key $INPUT_TOKEN --fail-on any --log --no-post-status
fi
if [ "$INPUT_USE_FLAKE8" = true ] ; then
    flake8 $INPUT_EXTRA_FLAKE8_OPTIONS | lintly --format=flake8 --api-key $INPUT_TOKEN --fail-on any --log --no-post-status
fi
if [ "$INPUT_USE_MYPY" = true ] ; then
    mypy $INPUT_EXTRA_MYPY_OPTIONS
    exit_code=$?
    if [ "$exit_code" != "0" ]; then
        exit $exit_code
    fi
fi
