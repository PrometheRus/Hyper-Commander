# Hyper-Commander

It is a project from Hyperskill: https://hyperskill.org/projects/327?track=26

Prints the main menu and wait for user input;

### If the user input is 1:
- prints operating system and node name;

### If the user input is 2:
- prints the user information;

### If the user input is 3:
prints **_The list of files and directories_**:
- List the files and directories;
    - Prints the file menu and wait for user input:
      - If the user input is a directory name, keeps the functionality from the previous step;
      - If the user input is up, keeps the functionality from the previous step; 
      - If the user input is a file name:
        - Prints the file options menu; 
        - Waits for the user input 
        - If the user input is 1:
          - Deletes the file; 
          - Prints file-name has been deleted. 
        - If the user input is 2:
          - Ask for a new file name Enter the new file name:; 
          - Renames the file; 
          - Prints file-name has been renamed as new-file-name 
        - If the user input is 3:
          - Give the read-and-write access to the owner, group, and others; 
          - Prints Permissions have been updated.; 
          - Prints the details of the file. 
        - If the user input is 4:
          - Gives the read-and-write access to the owner and group. Give read access to others; 
          - Prints Permissions have been updated.; 
          - Prints the details of the file. 
        - If the user input is 0, goes one level back; 
        - If the user input is invalid, prints the file options menu again; 
        - After each valid operation, starts from file menu. 
      - If the user input is 0, returns to the main menu; 
      - If anything else, prints **_Invalid input!_** and starts over.

### If the user input is 4:
Asks for an executable name **_Enter an executable name_**:
- If the executable with that name does not exist, prints **_The executable with that name does not exist_**!
- If the executable with that name exists:
  - Prints the executable location **_Located in: /is/located/here_**
  - Asks for arguments **_Enter arguments:_**
  - Runs the executable with the given arguments and prints the result. 
- Returns to the main menu.