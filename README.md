# Bacula community edition

# Linux
Bacula Linux Binaries Deb / Rpm can be found on [Bacula websitei] (https://www.bacula.org/bacula-binary-package-download/)
To access these binaries, you will need an access key, which will be provided when you complete a simple registration.

# Windows
Bacula Windows Binaries can be found on [Bacula websitei] (https://www.bacula.org/binary-download-center/)

# Create bacula client config files
You can create client config files automatically. For this you can find some scripts and templates on the repo. You load the files into a directory and start the bash scripts.

- For Linux
```bash
wget 
wget
wget
wget
```
- For Windows
```bash
wget
wget
wget
wget
```
- you can read out bacula-mon password. After that you can insert the password into the script: 2_create_new_bacula_client_linux--client_side_template.sh. The variable is called: DIRECTOR_CONSOLE_MONITOR_PASSWORD. You must use single quote marks. As an example: DIRECTOR_CONSOLE_MONITOR_PASSWORD='MySuperPassword'
```bash
BACULA_SERVER_CONFIG_DIR_DOCKER=/opt/bacularis/data/bacula/config/etc/bacula/bacula-dir.conf
cat ${BACULA_SERVER_CONFIG_DIR_DOCKER} |sed -n '/bacula-mon/,+1p' |grep Password |cut -f 2 -d '"'
```

