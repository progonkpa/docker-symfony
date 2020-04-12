The domain in this explanation is wickedtruths.org.

1. Add a configuration for the SSL site in `/etc/apache2/sites-available` named wickedtruths.org.conf.  
Example of a minimal configuration:
```
<VirtualHost *:443>
    SSLEngine On
    SSLCertificateFile /etc/letsencrypt_porkbun/domain.cert.pem
    SSLCertificateKeyFile /etc/letsencrypt_porkbun/private.key.pem
    SSLCertificateChainFile  /etc/letsencrypt_porkbun/intermediate.cert.pem

    ServerAdmin info@wickedtruths.org
    ServerName wickedtruths.org
    ServerAlias www.wickedtruths.org
    DocumentRoot /var/www/html
    ErrorLog /var/www/html/log/error.log
    CustomLog /var/www/html/log/access.log combined
</VirtualHost>
```

2. If there's no symbolic link in `/etc/apache2/sites-enabled` that points to the .conf in `/etc/apache2/sites-available`, run:  
`a2ensite wickedtruths.org`

3. Enable the SSL module.  
`a2enmod ssl`

4. Restart apache.  
`service apache2 restart`