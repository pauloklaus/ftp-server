# FTP Server

Dockerfile to create a ftp server using [vsftpd](https://github.com/djarosz/vsftpd) project.

Default login:

- user: ftpuser
- password: ftp123

## Build

```shell
docker build -t ftp-server .
```

## Run

```shell
docker run -d -p 21:21 -p 30000-30009:30000-30009 ftp-server
```

## Configuration defaults

[/etc/vsftp/vsftpd.conf](./vsftpd.conf)

## Override the default ftp config file

```shell
docker run -d -p 21:21 -p 30000-30009:30000-30009 -v my-vsftpd.conf:/etc/vsftp/vsftpd.conf ftp-server
```

## Persist ftp files

```shell
docker run -d -p 21:21 -p 30000-30009:30000-30009 -v ./my-ftp-files:/var/ftp ftp-server
```

## Set custom password

```shell
docker run -d -p 21:21 -p 30000-30009:30000-30009 -v ./my-ftp-files:/var/ftp -e FTP_PASSWORD="n3w-cu5tom-p@ss" ftp-server
```
