FROM opensuse/leap:15.2

MAINTAINER cosmin.tanczel@gmail.com
RUN zypper ar http://download.opensuse.org/repositories/server:/php:/applications/openSUSE_Leap_15.2/ server-php-applications
RUN zypper ref
RUN zypper -n up
RUN zypper in postfix
RUN zypper in dovecot
RUN zypper in clamav
RUN zypper in freshclam
RUN zypper in amavisd-new
RUN zypper in postgrey
RUN zypper in squirrelmail
RUN zypper install -y dbus-1 systemd-sysvinit
RUN cp /usr/lib/systemd/system/dbus.service /etc/systemd/system/; \
    sed -i 's/OOMScoreAdjust=-900//' /etc/systemd/system/dbus.service

VOLUME ["/sys/fs/cgroup", "/run"]

CMD ["/sbin/init"]
docker run -d --name=oss15_MailServer -v /sys/fs/cgroup:/sys/fs/cgroup:ro oss152_mailserver
