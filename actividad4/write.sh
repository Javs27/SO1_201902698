
#!/bin/bash

PIPE=$1

while true; do
    read input
    echo "$input" >$PIPE
done
