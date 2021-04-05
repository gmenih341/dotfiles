#!/bin/zsh

MODE="$1"

if [! "$MODE" = "night" && ! "$MODE" = "day" ]; then
    echo "Invalid! $$MODE must be day or nigth!";
    exit;
fi

# DO NOT EDIT THIS FILE
for FN in $CONF_PATH/*; do
    # if file, directly source it
    if [ -f "$FN" ]; then
        source "$FN"
    fi

    # if directory, make sure the name of the directory
    # is an existing command - if so, source files in directory
    if [ -d "${FN}" ]; then
        CMD=$(echo "$FN" | awk '{n=split($1,A,"/"); print A[n]}')

        if which "$CMD" >/dev/null 2>&1; then
            for DEPFN in $FN/*; do
                source "$DEPFN"
            done
        fi
    fi
done