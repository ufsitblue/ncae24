#!/bin/bash
### print go binaries

golang() {
    echo -e "\n----------\n> Golang <\n----------"
    # Put all binaries larger than 1Mb into array
    ## TAKE NOTE OF EXCLUSION
    mapfile -d $'\0' files < <(sudo find / -type f -executable -size +1M  \( ! -path '*snap*' ! -path '*container*' ! -path '*docker*' \) -print0 2>/dev/null)

    # Check each file
    for i in "${files[@]}"
    do 
        # Does it contain the go header "go1\."
        if [[ $(strings $i 2>/dev/null | grep 'go1\.' 2>/dev/null) ]]; then   
            echo "Detected GO Binary : $i"
        else
            continue
        fi
    done
}

golang

### print binaries that mention sliver

sliver() {
    echo -e "\n----------\n> Sliver <\n----------"

    echo "Note that new sliver binaries no longer include the string \"sliver\""
    # Put all binaries larger than 1Mb into array
    ## TAKE NOTE OF EXCLUSION
    mapfile -d $'\0' files < <(sudo find / -type f -executable -size +1M -print0 2>/dev/null)
    # Check each file
    for i in "${files[@]}"
    do 
        # Does it contain the string "sliver"
        if [[ $(strings $i 2>/dev/null | grep 'sliver' 2>/dev/null) ]]; then   
            echo "Detected Potential Sliver Binary : $i"
        else
            continue
        fi
    done
}

silver
