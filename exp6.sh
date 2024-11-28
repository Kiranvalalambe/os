
if [ $# -lt 2 ]; then
    echo "Usage: $0 <word> <file1> [file2 ...]"
    exit 1
fi

word="$1"
shift

for file in "$@"
do
   
    if [ ! -f "$file" ]; then
        echo "File not found: $file"
        continue
    fi

    
    sed "/$word/d" "$file" > "$file.tmp"

   
    mv "$file.tmp" "$file"

    echo "Processed $file: Removed lines containing '$word'"
done

echo "All files processed."
