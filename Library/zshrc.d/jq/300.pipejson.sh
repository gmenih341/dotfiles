# Read by lines and try to format JSON
function pipejson() {
    while read LINE; do
        if [[ $LINE =~ \/health ]]; then
            continue
        fi
        if [[ $LINE =~ ^\{.* ]]; then
            echo $LINE | jq -C
        else
            echo $LINE
        fi
    done
}
