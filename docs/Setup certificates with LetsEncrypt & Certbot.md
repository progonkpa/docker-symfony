The installation of Certbot is taken care of in the Wordpress image.

Run this command to start Certbot. It will acquire all certificates and configure Apache.
certbot --apache --non-interactive -d wickedtruths.org --agree-tos -m progonkpa@telenet.be

###Telenet home network configuration
- Enable portforwarding on port 80
- Disable Windows firewall or create a rule that allows incoming traffic on port 80

