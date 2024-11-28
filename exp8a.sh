

# Check if any arguments were provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 file1 [file2 ...]"
    echo "Please provide at least one file or directory name as argument."
    exit 1
fi

# Loop through all arguments
for item in "$@"; do
    # Check if the item exists
    if [ -e "$item" ]; then
        # Check if it's a directory
        if [ -d "$item" ]; then
            echo "'$item' is a directory"
        # Check if it's a regular file
        elif [ -f "$item" ]; then
            # Count the number of lines in the file
            line_count=$(wc -l < "$item")
            echo "'$item' is a file with $line_count lines"
        else
            echo "'$item' exists but is neither a regular file nor a directory"
        fi
    else
        echo "'$item' does not exist"
    fi
done
