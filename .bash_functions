function whoisonport() {
  lsof -n -i4TCP:$1 | grep LISTEN
}

export whoisionport
