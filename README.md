# Build an opensuse 15.2 image with systemctl enabled:

Run the following in bash with root privileges: 
"curl -L https://raw.githubusercontent.com/darkmac78/darkmac/master/run.sh | bash"

This will automatically download the Dockerfile needed to create an openSUSE 15.2 image and enable systemctl and will deploy the docker image.

## Dockerfile content:

FROM opensuse/leap:15.2

MAINTAINER cosmin.tanczel@gmail.com

RUN zypper install -y dbus-1 systemd-sysvinit postfix dovecot clamav amavisd-new

RUN cp /usr/lib/systemd/system/dbus.service /etc/systemd/system/; sed -i 's/OOMScoreAdjust=-900//' /etc/systemd/system/dbus.service

VOLUME ["/sys/fs/cgroup", "/run"]

CMD ["/sbin/init"]

# Build the image using opensuse/leap:15.2 and Dockerfile content that enables systemctl:
docker build -t=oss152_mailserver ./
# Run the image:
docker run -d --name=oss15_MailServer -v /sys/fs/cgroup:/sys/fs/cgroup:ro oss152_mailserver
# Conect to the running docker image (bash)
docker exec -it oss15_MailServer bash
