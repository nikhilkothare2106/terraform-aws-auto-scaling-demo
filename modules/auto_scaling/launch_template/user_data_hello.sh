#!/bin/bash
yum update -y
yum install -y nginx
 
systemctl start nginx
systemctl enable nginx
 
echo "<h1>Instance hello</h1>" > /usr/share/nginx/html/index.html
 
mkdir -p /usr/share/nginx/html/hello
echo "<h1>Hello from instance </h1>" > /usr/share/nginx/html/hello/index.html
 
echo "<h1>Healthy instance hello</h1>" > /usr/share/nginx/html/health
 
systemctl restart nginx