# pmsarm7 [![Build Status](https://travis-ci.org/tproenca/pmsarm7.svg?branch=master)](https://travis-ci.org/tproenca/pmsarm7)
Plex Media Server ARM package for Debian/Ubuntu Linux

### Motivation
Since dev2day pms repository is outdated has been a while, I decided to create an automatic solution to have fresh .deb files in an APT repository as soon as Plex release their binaries. You might want to use this solution if you have an ARM based linux, such as a NAS or Raspberry Pie.

### Setup
```bash
echo "deb http://dl.bintray.com/tproenca/pmsarm7 jessie main" | sudo tee /etc/apt/sources.list.d/pms.list
```

### Instalation
```bash
sudo apt-get update
sudo apt-get install plexmediaserver
sudo nano /etc/init.d/plexmediaserver
  (comment our the following line:)
  test -f "/usr/lib/plexmediaserver/start.sh" || exit 0
```

### Configuration
Modify the configuration file at /etc/default/plexmediaserver simply by
```bash
sudo nano /etc/default/plexmediaserver
```

### Thanks
* Special thanks to HTPC Guides team for the great tutorials
* To Jan Friedrich (uglymagoo) <<jft@dev2day.de>> for providing the base skeleton.tgz

