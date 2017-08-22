renameimg () { 
  ristretto "$1" &
  pid=$!
  echo 'new name: '
  read a
  kill $pid
  mv "$1" "$a.jpg" 
}

showimg () { 
  ristretto "$1" &
  pid=$!
  echo 'return for nex: '
  read a
  kill $pid
}

export -f renameimg
export -f showimg
