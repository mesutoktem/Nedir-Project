#!/bin/bash
if touch ./app/views/key_words/with_patterns/$1.html.erb
then
     echo "OK"
else
     echo "FAILED"
fi