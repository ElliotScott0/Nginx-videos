# NginxVideo
Dockerfile for serving streaming video from nginx

uses the nginx -rtmp file

##Usage:

docker build -t video:latest .

VOLUME /var/mp4s
VOLUME /var/www

docker run -d -p 1935:1935 -p 80:80 --name videoserv -v $PWD/mp4:/var/mp4s -v $PWD/www:/var/www video:latest

Expects mp4 files in the mp4 directory

Expects html and graphics in www/html directory

video stats are in www.example.com/stats



