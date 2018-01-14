# general search script
- To use from terminal or from Alt+F2
- Put it in ~/bin, which should be in PATH
- Name it 'a' for example
- Use it, to search in youtube:
a y best of metallica


```bash
#!/bin/bash
 
COMMAND=$1
shift
 
case "$COMMAND" in
  y)
    query=`echo "$@" | tr " " +`
    google-chrome-stable "https://www.youtube.com/results?search_query=$query"
    ;;
  g)
    query=`echo "$@" | tr " " +`
    google-chrome-stable "https://www.google.es/search?q=$query"
    ;;
 
  *)
    notify-send "Eiiii carballeira!"
    ;;
esac
```