  if [ "$#" -ne 3 ]; then
	echo "Error:Incorrect number of arguments"
	echo "Usage:$0 filename start_line end_line"
	exit 1
fi

filename="$1"
start_line="$2"
end_line="$3"


if [ ! -f "$filename" ];then
	echo "Error:File '$filename' does not exist"
	exit 1
fi


if ! [[ "$start_line" =~ ^[0-9]+$ ]] || ! [[ "$end_line" =~ ^[0-9]+$ ]]; then
	echo "Error: Start and end line numbers must be positive integers"
	exit 1
fi


if [ "$start_line" -gt "$end_line" ]; then
	echo "Error: Start line cannot be greater than end line"
	exit 1
fi

line_count=$(wc -l < "$1")

echo " The total number of lines in $2: $line_count"


sed -n "${start_line},${end_line}p" "$filename"
