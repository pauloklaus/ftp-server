FROM alpine:latest

ENV FTP_PASSWORD="ftp123"

RUN apk update && apk add vsftpd

RUN mkdir -p /var/ftp && \
    adduser -h /var/ftp -D ftpuser

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21

# CMD ["/usr/sbin/vsftpd", "-obackground=NO", "/etc/vsftpd/vsftpd.conf"]
CMD echo "ftpuser:${FTP_PASSWORD}" | chpasswd && /usr/sbin/vsftpd -obackground=NO /etc/vsftpd/vsftpd.conf
