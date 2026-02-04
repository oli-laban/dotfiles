function sail() {
  if ! docker info &> /dev/null; then
    echo "Starting OrbStack..."
    
    open -a OrbStack
    
    while ! docker info &> /dev/null; do
      sleep 1
    done
  fi
  
  sh $([ -f sail ] && echo sail || echo vendor/bin/sail) "$@"
}

function ssh-list() {
  echo "\nConfigured SSH Hosts:\n"
  
  awk '
    /^Host / {
      host = $2
      if (host != "*") {
        hosts[host] = ""
      }
    }
    /^  HostName / {
      if (host != "*") {
        hosts[host] = $2
      }
    }
    END {
      for (h in hosts) {
        printf "  \033[1;36m%-25s\033[0m → %s\n", h, (hosts[h] ? hosts[h] : "")
      }
    }
  ' ~/.ssh/config 2>/dev/null | sort
  
  echo ""
}
