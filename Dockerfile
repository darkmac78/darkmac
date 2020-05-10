FROM opensuse/leap:15.2

MAINTAINER cosmin.tanczel@gmail.com
RUN zypper install -y dbus-1 systemd-sysvinit
RUN cp /usr/lib/systemd/system/dbus.service /etc/systemd/system/; \
    sed -i 's/OOMScoreAdjust=-900//' /etc/systemd/system/dbus.service

VOLUME ["/sys/fs/cgroup", "/run"]

CMD ["/sbin/init"]
RUN zypper ar http://download.opensuse.org/repositories/server:/php:/applications/openSUSE_Leap_15.2/ server-php-applications
RUN sleep 5
RUN zypper lr|grep server-php-applications
RUN sleep 5
RUN zypper ref
RUN sleep 5
RUN zypper -n up
RUN sleep 5
