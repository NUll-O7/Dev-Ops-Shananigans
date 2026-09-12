# Linux Fundamentals Homework

This is a small practice guide for four Linux topics that come up often in
day-to-day work and technical interviews.

Run the commands in a test directory or virtual machine. Commands beginning
with `sudo` need administrator access.

## 1. Soft links and hard links

A link is another name or path for a file.

### Soft link (symbolic link)

A soft link stores the path to another file. It can point to directories, and
it can cross filesystems, but it stops working if the original path disappears.

```bash
echo "hello Linux" > original.txt
ln -s original.txt soft-link.txt
cat soft-link.txt
ls -l original.txt soft-link.txt
rm soft-link.txt
```

Create one with:

```bash
ln -s <original> <link-name>
```

### Hard link

A hard link is another directory entry for the same file data (the same inode).
Both names keep the data available, so deleting the original name does not
delete the file. Hard links normally cannot cross filesystems or point to
directories.

```bash
echo "hello Linux" > original.txt
ln original.txt hard-link.txt
ls -li original.txt hard-link.txt
rm original.txt
cat hard-link.txt
rm hard-link.txt
```

Create one with:

```bash
ln <original> <link-name>
```

### Interview answer

“A soft link points to a pathname, so it can break and can cross filesystems.
A hard link points to the same inode and data, so it survives removal of the
original name, but it usually cannot cross filesystems or link directories.”

## 2. `adduser` vs `useradd`

Both commands create users, but they have different goals:

| Command | What it is | Typical use |
| --- | --- | --- |
| `adduser` | Friendly, interactive wrapper | Creating a normal user on Ubuntu/Debian |
| `useradd` | Low-level system utility | Scripts, automation, and precise account setup |

On Ubuntu, `adduser` is usually the easier choice because it asks sensible
questions, creates the home directory, and sets up the account with safer
defaults. Use `useradd` when you specifically need its lower-level options and
know which defaults you want.

Create a practice user:

```bash
sudo adduser homework-user
```

When finished, remove the practice account and its home directory:

```bash
sudo deluser --remove-home homework-user
```

## 3. `journalctl`

`journalctl` reads logs collected by `systemd-journald`. It is useful for
checking what happened during boot, investigating errors, and viewing logs for
a particular service.

Useful examples:

```bash
# Logs from the current boot
sudo journalctl -b

# Logs from today
sudo journalctl --since today

# Logs for a service (SSH is commonly named ssh on Ubuntu)
sudo journalctl -u ssh

# Recent service logs, newest entries last
sudo journalctl -u ssh -n 50

# Follow new entries as they arrive
sudo journalctl -u ssh -f
```

If the service name is different, check it with `systemctl list-units --type=service`.
Press `q` to leave the normal log view and `Ctrl+C` to stop a live view.

## 4. Small command cheat sheet

| Command | Purpose | Example |
| --- | --- | --- |
| `pwd` | Show the current directory | `pwd` |
| `ls` | List files | `ls -la` |
| `cd` | Change directory | `cd /var/log` |
| `mkdir` | Create a directory | `mkdir practice` |
| `touch` | Create an empty file | `touch notes.txt` |
| `cp` | Copy files | `cp notes.txt backup.txt` |
| `mv` | Move or rename files | `mv backup.txt old-notes.txt` |
| `rm` | Delete files | `rm old-notes.txt` |
| `cat` | Print file contents | `cat notes.txt` |
| `less` | Read a file one screen at a time | `less /var/log/syslog` |
| `grep` | Search text | `grep error app.log` |
| `find` | Find files | `find . -name '*.log'` |
| `man` | Open a command manual | `man journalctl` |
| `whoami` | Show the current user | `whoami` |
| `id` | Show user and group IDs | `id` |
| `chmod` | Change permissions | `chmod 600 secret.txt` |
| `df` | Show free disk space | `df -h` |
| `du` | Show directory size | `du -sh .` |
| `ps` | Show running processes | `ps aux` |
| `systemctl` | Manage systemd services | `systemctl status ssh` |

Be especially careful with `rm` and commands run with `sudo`. When unsure,
read the manual first: `man <command>`.
