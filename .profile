LOCAL=$HOME/.local

PATH=$LOCAL/bin:$PATH
PATH=$PATH:$HOME/pg/yelp-main/tools/
export PATH=$PATH:$LOCAL/lib/maven/bin

#YourKit Java Profiler
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LOCAL/yjp-8.0.30/bin/linux-x86-64/

unset LOCAL