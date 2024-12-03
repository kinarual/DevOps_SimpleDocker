#!/bin/bash
rm -f mini_server
gcc -o mini_server main.c -lfcgi
nginx -g "daemon off;" &
spawn-fcgi -a 127.0.0.1 -p 8080 ./mini_server
tail -f /dev/null