# Twitter client
npm -v 2>&1 >/dev/null || e_error "Error running npm" && return 1

npm install -g vue-language-server
