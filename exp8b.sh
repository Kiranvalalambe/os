# Check if at least two files are provided as arguments
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 file1 file2 [file3 ... fileN]"
    exit 1
fi

# First argument is the file containing words to count
main_file="$1"
shift  # Remove the first file from the argument list, keeping the rest of the files

# Read words from the first file
while read -r word; do
   
    total_count=0
    
    
    for file in "$@"; do
        if [ -f "$file" ]; then
            # Count occurrences of the word in the current file
            count=$(grep -wo "$word" "$file" | wc -l)
            total_count=$((total_count + count))
        else
            echo "File $file does not exist."
        fi
    done

    # Report the word count
    echo "Word '$word' occurs $total_count times in the other files."

done < "$main_file"
