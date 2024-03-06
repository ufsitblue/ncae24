#!/bin/bash

#Function to check for mmalicious aliases in a file
check_aliases() {
  local file="$1"
  local malicious_aliases=0

  #Check if the file exists
  if [ -f "$file" ]; then
    echo "Checking $file for malicious aliases..."

    #Search for aliases defined in the file
    while IFS= read -r line; do
      #Check if the line starts with "alias" and contains mal
      if [[ "$line" == alias\ * && "$line" =~ (rm|mv|cp|wget|curl|nc|netcat) ]]; then
        echo "Potential malicious alias found: $line"
        malicious_aliases=$((malicious_aliases+1))
      fi
    done < "$file"

    if [ "$malicious_aliases" -eq 0 ]; then
      echo "No malicious aliases found in $file."
    fi
  else
    echo "File $file does not exist."
  fi
}

# Check common user shell configuration files
check_aliases /home/*/.bashrc
check_aliases /home/*/.bash_profile
check_aliases /home/*/.bash_aliases
check_aliases /home/*/.zshrc
check_aliases /home/*/.profile

# Check global shell configuration files
check_aliases /etc/bash.bashrc
check_aliases /etc/profile
check_aliases /etc/zshrc

