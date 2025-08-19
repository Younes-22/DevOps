# 🖥️ BASH Scripting

## What is BASH?
Bash is a powerful command-line interpreter and scripting language used on Unix-like operating systems.  
By writing scripts in a `.sh` file and making them executable, you can **automate repetitive tasks** and save time.

---

## 📜 Creating and Running a BASH Script

1. **Create the script file**  
   ```bash
   touch my-first-script.sh
Add content (using a text editor like vim or nano)

bash
Copy
Edit
vim my-first-script.sh
Example "Hello World!" script:

bash
Copy
Edit
#!/bin/bash
echo "Hello World!"
Make it executable

bash
Copy
Edit
chmod +x my-first-script.sh
Run the script

Using the path:

bash
Copy
Edit
./my-first-script.sh
➝ Output: Hello World

Using an interpreter:

bash
Copy
Edit
sh my-first-script.sh
# or
bash my-first-script.sh
🔑 Key BASH Concepts
1. Shebang (#!)
The shebang is always the first line of a script:

bash
Copy
Edit
#!/bin/bash
It tells the OS which interpreter to use.

Example for Python:

bash
Copy
Edit
#!/usr/bin/python3
2. Comments
Single-line:

bash
Copy
Edit
# This is a single-line comment
Multi-line (workaround using quotes or heredocs):

bash
Copy
Edit
: '
This is a
multi-line comment
'
3. Variables and Parameters
Variables:

bash
Copy
Edit
Name="Ahmed"
echo "Hello, $Name"
Parameters:

bash
Copy
Edit
echo "First parameter: $1"
echo "All parameters: $@"
4. Arithmetic Expressions
Perform arithmetic using $(( )):

bash
Copy
Edit
Num1=$1
Num2=$2
Result=$((Num1 + Num2))
echo "Sum = $Result"
5. Changing the PATH
To run a script globally (without ./), move it into a directory already in your PATH (e.g., /usr/local/bin) and drop the .sh extension.

To permanently add a directory to your PATH in zsh:

bash
Copy
Edit
echo "export PATH=$PATH:~/my_scripts" >> ~/.zshrc
✅ Summary
Bash scripts let you automate tasks and boost productivity.

Key elements: shebang, comments, variables, parameters, arithmetic, PATH management.

With practice, you can scale from "Hello World!" scripts to full automation pipelines.