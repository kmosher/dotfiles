if ! [ -f ~/.gist ]; then
    echo "Setting up OAuth for the gist tool"
    gist --login
fi
