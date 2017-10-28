# Awesome Bash PS1

### What is it
![screen](https://github.com/sergkondr/stuff/blob/master/bash_smoothly_ps.png)

It displays:
- Hostname
- Current username (with color designation of the root)
- Git branch(with uncommited changes)
- Python virtualenv name

### How to install
```
sudo cp ./bash_prompt.sh /etc/profile.d/
echo 'source /etc/profile' >> ~/.bashrc
```
reopen/relogin into terminal (tty/ptty)
