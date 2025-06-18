#!/usr/bin/env bash

# Basic scripting 


field() {
	# Wrapper function for awk to get a field from a text
	# Arg1 which field to get (default to 1)
	# Arg2 what delimiter to use (default is whitespace)
	awk -F "${2:- }" "{ print \$${1:-1} }"
}

field() {
    # Wrapper function for awk to get a field from a text, version 2 - augmented to remove white space
    # Arg1: which field to get (default to 1)
    # Arg2: what delimiter to use (default is whitespace)

    local field_num="${1:-1}"
    local delimiter="${2:- }" # If delimiter is a space, awk's default behavior handles multiple spaces.
                               # If it's a specific character like '=', we need to trim explicitly.
    awk -F "${delimiter}" -v field_num="${field_num}" '{
        # Get the requested field
        extracted_field = $field_num
        # Remove leading whitespace from the extracted field
        sub(/^[[:space:]]+/, "", extracted_field)
        # Remove trailing whitespace from the extracted field
        sub(/[[:space:]]+$/, "", extracted_field)
        print extracted_field
    }'
}


summarize() {
    local f=${1:-1}
    awk -F "${2:- }" "
    length(\$$f) {
        if (max == \"\")
            max = min = \$$f;
        i += 1;
        sum += \$$f;
        if (\$$f > max)
            max = \$$f
        if (\$$f < min)
            min = \$$f
    }
    END {
        # Using %-12s for left-justified strings 12 characters wide
        printf \"%-12s%d\n\", \"lines\", i;
        printf \"%-12s%.0f\n\", \"min\", min;
        printf \"%-12s%.0f\n\", \"max\", max;
        printf \"%-12s%.0f\n\", \"sum\", sum;
        printf \"%-12s%.2f\n\", \"avg\", sum/i;
        printf \"%-12s%.2f\n\", \"average-5%\", (sum/i) * 0.95;
        printf \"%-12s%.2f\n\", \"average+5%\", (sum/i) * 1.05;
    }"
}
