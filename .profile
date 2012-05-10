LOCAL=$HOME/.local

export PATH=$LOCAL/bin:$PATH
export PATH=$PATH:$LOCAL/lib/maven/bin

#YourKit Java Profiler
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LOCAL/yjp-8.0.30/bin/linux-x86-64/

unset LOCAL