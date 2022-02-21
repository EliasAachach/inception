# setting the OS
FROM	debian:buster

# setting the author
LABEL	elaachac <elaachac@student.42.fr>

# update apt
RUN	apt -y update

# installing nginx
RUN	apt -y install nginx

# launch daemon nginx
CMD	[ "nginx", "-g", "daemon off;" ]
