#!/usr/bin/env bash

echo "Hello $USER!"

printCommanderMenu() {
cat << EOF

------------------------------
| Hyper Commander            |
| 0: Exit                    |
| 1: OS info                 |
| 2: User info               |
| 3: File and Dir operations |
| 4: Find Executables        |
------------------------------
EOF
}

printFileOptionsMenu() {
  cat << EOF
---------------------------------------------------------------------
| 0 Back | 1 Delete | 2 Rename | 3 Make writable | 4 Make read-only |
---------------------------------------------------------------------
EOF
}

printFileMenu() {
cat << EOF
---------------------------------------------------
| 0 Main menu | 'up' To parent | 'name' To select |
---------------------------------------------------
EOF
}

listFilesAndDirectories() {
  echo "The list of files and directories:"
    dirList=$(find * -maxdepth 0)

    for dir in $dirList
    do
      if [ -d "$dir" ]; then
        echo "D $dir"
      else
        echo "F $dir"
      fi
    done
}

osInfo() {
  echo -e "$(hostname) $(uname)"
}

userInfo() {
  whoami
}

processFile() {
  while true; do
    printFileOptionsMenu
    read -r
    case $REPLY in
    0) break ;;
    1) rm "$1" && echo "$1 has been deleted." && break ;;
    2) echo "Enter the new file name:" && read -r newName && mv "$1" "$newName" && echo "$1 has been renamed as $newName" && break;;
    3) chmod 666 "$1" && echo "Permissions have been updated." && ls -l "$1" && break ;;
    4) chmod 664 "$1" && echo "Permissions have been updated." && ls -l "$1" && break ;;
    *) continue ;; # if the user input is invalid, print the file options menu again;
    esac
  done
}

fileDirOperations () {
  while true; do

    printFileMenu
    listFilesAndDirectories
    read -r

    case $REPLY in
      0) break;;

      "up") cd .. && listFilesAndDirectories;;

      *) if [[ -f "$REPLY" ]]; then # if it is a file
          processFile $REPLY
        elif [[ -d "$REPLY" ]]; then # if it is a dir
          cd "$REPLY" && listFilesAndDirectories
        else
          echo -e "Invalid input!\n"
        fi ;;

    esac

  done
}


findExecutables() {
  echo "Enter an executable name:"
  read -r
  if [[ -f $(which "$REPLY") ]]; then
    printExecutables "$REPLY" # the argument is a command from input
  else
    echo "The executable with that name does not exist!"
  fi
}

printExecutables() {
  echo "Located in: $(which "$1")"
  echo "Enter arguments:"
  read -r
  "$1" "$REPLY"
}

while true; do
  printCommanderMenu
  read -r
  case $REPLY in
    1) osInfo ;;
    2) userInfo ;;
    3) fileDirOperations ;;
    4) findExecutables ;;
    0) echo "Farewell!"; break;;
    *) echo "Invalid option!";
  esac
done