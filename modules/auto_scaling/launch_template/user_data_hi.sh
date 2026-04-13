#!/bin/bash
yum update -y
yum install -y nginx
 
systemctl start nginx
systemctl enable nginx
 
echo "<h1>Instance hi</h1>" > /usr/share/nginx/html/index.html
 
mkdir -p /usr/share/nginx/html/hi
echo "<h1>Hi from instance </h1>" > /usr/share/nginx/html/hi/index.html
 
echo "<h1>Healthy instance hi</h1>" > /usr/share/nginx/html/health
 
systemctl restart nginx