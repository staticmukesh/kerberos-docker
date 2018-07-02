kerberos-docker
===============

A Lightweight Kerberos Server docker image based on Alpine Linux.

#### Usage

Docker image configures the `kadmind` and `krb5kdc` server as per the following environment variables and starts the server. 

| Environment Variable | Default Value   | Description           
|----------------------|-----------------|-----------------------|
| REALM_NAME           | EXAMPLE.COM     | Realm name            |
| DOMAIN_NAME          | example.com     | Domain name           |
| KADMIN_PASS          | Secure_Password | Kadmin password       |
| MASTER_PASS          | Master_Password | Master db password    |

`kadmin` runs on port `749` and `krb5kdc` runs on `88` by default.

To run the `kerberos-docker`, use the following command

`docker run -d -p 749:749 -p 88:88 staticmukesh/kerberos-docker`

#### Contribution

Feel free to raise issues or pull request at [https://github.com/staticmukesh/kerberos-docker](https://github.com/staticmukesh/kerberos-docker), if you have any suggestions.