FROM opensuse/leap:15.2
MAINTAINER cosmin.tanczel@gmail.com
RUN zypper ar --gpgcheck-allow-unsigned-repo http://download.opensuse.org/repositories/server:/php:/applications/openSUSE_Leap_15.2/ server-php-applications
RUN zypper install -y dbus-1 systemd-sysvinit postfix dovecot squirrelmail amavisd-new clamav freshclam postgrey
RUN cp /usr/lib/systemd/system/dbus.service /etc/systemd/system/; sed -i 's/OOMScoreAdjust=-900//' /etc/systemd/system/dbus.service

VOLUME ["/sys/fs/cgroup", "/run"]

CMD ["/sbin/init"]
