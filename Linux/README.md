# 🐧 Linux Fundamentals

## 🔑 What is Linux?
Linux is a powerful open-source operating system widely used in servers, development, and cloud environments.  
It provides stability, flexibility, and control through its **shell** and command-line tools.

---

## 🖥️ The Shell
The **shell** is the interface between the user and the operating system.  
- Most common: **Bash (Bourne Again Shell)**  
- Alternative: **Zsh (Z Shell)** with advanced features like auto-completion and customization.  

Check your current shell:  
```bash
echo $SHELL

---

📂 File & Directory Management
Linux uses a hierarchical file system starting from /.
Common commands:

pwd         # Print working directory
ls          # List files
cd dir/     # Change directory
mkdir dir/  # Create directory
rm file     # Remove file
cp src dst  # Copy file/directory
mv src dst  # Move/rename

---

🔒 File Permissions
Permissions apply to user, group, and others with read (r), write (w), execute (x).
View permissions:

ls -l

Modify permissions:

chmod u+x script.sh    # Add execute permission for user
chown user:group file  # Change owner and group

---

📤 Standard Streams & Redirection
stdin (input), stdout (output), stderr (errors)
Redirection examples:

ls > out.txt        # Redirect output
ls >> out.txt       # Append output
ls missing 2> err.txt  # Redirect errors

---

🌍 Environment Variables
View variables:

echo $PATH
echo $HOME
Set temporarily:

export NAME=VALUE
Set permanently in ~/.bashrc or ~/.zshrc.

---

🔑 sudo Command
sudo lets you run commands with elevated (root) privileges.
Example:

sudo apt update
sudo su   # Switch to root user (dangerous!)

---

📖 Handy Command Reference

ls -la        # List all files (detailed)
man <command> # Manual pages
cat file      # Show contents
grep "txt" f  # Search in file
head -n 5 f   # First 5 lines
tail -n 5 f   # Last 5 lines
wc -l f       # Count lines
ps aux        # List processes
top           # Live process monitor
kill <PID>    # Kill process
ping host     # Test connectivity
df -h         # Disk usage

📚 Learning Resources
Linux Journey – Interactive tutorials

The Ultimate Linux Newbie Guide – Beginner-friendly

OverTheWire Bandit – Hands-on Linux challenges