# make-backups
A bare-bones backup tool for debian-based linuxes made with GNU make.

## Setup
- Install duplicity and gpg.
- Setup your gpg keys.
- Mount a volume for backups.
- Check out this repo into a directory on that backup volume.
- Run make periodically in the root of the checked-out repo.

## What Does This Do?
- Creates a backup of your APT repository sources, keys, and a list of
	your installed packages.
- An encrypted full backup of your homedir minus the keybase fs
	directory, `.cache` directory, and a few other things.
	
## How do I restore my homedir?
- Read duplicity's manpage.
- Use duplicity to restore your homedir or files within your homedir.

## How do I restore APT's things?
Pick and extract a tarball from the apt directory. Then run the
following as root:

		rm -f /etc/apt/sources.list.d/*
		cp -rv sources.list* /etc/apt/
		apt-key import apt-key-backup.asc
		dpkg --clear-selections
		dpkg --set-selections < dpkg-selections
		apt-get autoremove --purge

## How 'come it doesn't do that for me?
Sharp tools should be wielded by a human and this hackish backup
solution ain't perfect.

