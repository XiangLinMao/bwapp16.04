# bWAPP docker
This docker image is based on ubuntu 16.04, used apache2 + mysql + php5 

## How to use

1. build docker image

```bash
#bwapp is your images name
$ docker build -t bwapp .
```

2. create docker container

```bash
# 照打就對了，最後"bwapp"記得更改
$ docker run -d --name bwapp_vul -p 0.0.0.0:8080:80 bwapp
```



## Configuration instructions

* mysql account
> root/bug

* apache2 directory
> /var/www/html/

* bWAPP account
> bee/bug

## bWAPP Introduction

* SQL, HTML, iFrame, SSI, OS Command, PHP, XML, XPath, LDAP and SMTP injections
* Blind SQL injection and Blind OS Command injection
* Boolean-based and time-based Blind SQL injections
* Drupal SQL injection (Drupageddon)
* AJAX and Web Services issues (JSON/XML/SOAP)
* Heartbleed vulnerability (OpenSSL) + detection script included
* Shellshock vulnerability (CGI)
* Cross-Site Scripting (XSS) and Cross-Site Tracing (XST)
* phpMyAdmin BBCode Tag XSS
* Cross-Site Request Forgery (CSRF)
* Information disclosures: favicons, version info, custom headers,...
* Unrestricted file uploads and backdoor files
* Old, backup & unreferenced files
* Authentication, authorization and session management issues
* Password and CAPTCHA attacks
* Insecure DistCC, FTP, NTP, Samba, SNMP, VNC, WebDAV configurations
* Arbitrary file access with Samba
* Directory traversals and unrestricted file access
* Local and remote file inclusions (LFI/RFI)
* Server Side Request Forgery (SSRF)
* XML External Entity attacks (XXE)
* Man-in-the-Middle attacks (HTTP/SMTP)
* HTTP parameter pollution and HTTP verb tampering
* Denial-of-Service (DoS) attacks: Slow Post, SSL-Exhaustion, XML Bomb,...
* POODLE vulnerability
* BREACH/CRIME/BEAST SSL attacks
* HTML5 ClickJacking and web storage issues
* Insecure iFrame (HTML5 sandboxing)
* Insecure direct object references (parameter tampering)
* Insecure cryptographic storage
* Cross-Origin Resource Sharing (CORS) issues
* Cross-domain policy file attacks (Flash/Silverlight)
* Local privilege escalations: udev, sendpage
* Cookie and password reset poisoning
* Host header attacks: password reset poisoning en cache pollutions
* PHP CGI remote code execution
* Dangerous PHP Eval function
* Local and remote buffer overflows (BOF)
* phpMyAdmin and SQLiteManager vulnerabilities
* Nginx web server vulnerabilities
* HTTP response splitting, unvalidated redirects and forwards
* WSDL SOAP vulnerabilities
* Form-based authentication and No-authentication modes
* Active Directory LDAP integration
* Fuzzing possibilities
* and much more...
* HINT: download our bee-box VM > it has ALL necessary extensions
* bee-box is compatible with VMware and VirtualBox!
* Enjoy it little bees ;)