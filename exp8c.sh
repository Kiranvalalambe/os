lines=0
words=0
chars=0

while IFS= read -r line || [[ -n "$line" ]]; do
    # Count lines
    ((lines++))

    # Count words
    word_count=$(echo "$line" | tr -s ' ' '\n' | grep -c .)
    ((words += word_count))

    # Count characters
    char_count=${#line}
    ((chars += char_count))
done

echo "Lines: $lines"
echo "Words: $words"
echo "Characters: $chars"
