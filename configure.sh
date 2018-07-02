#! /env/sh

# Deafult values
REALM_NAME="${REALM_NAME-EXAMPLE.COM}"
DOMAIN_NAME="${DOMAIN_NAME-example.com}"
KADMIN_PASS="${KADMIN_PASS-Secure_Password}"
MASTER_PASS="${MASTER_PASS-Master_Password}"

# Copying krb5 conf file
cat > /etc/krb5.conf << EOL
[logging]
    default = FILE:/var/log/krb5libs.log
    kdc = FILE:/var/log/krb5kdc.log
    admin_server = FILE:/var/log/kadmind.log

[libdefaults]
    dns_lookup_realm = false
    ticket_lifetime = 24h
    renew_lifetime = 7d
    forwardable = true
    rdns = false
    default_realm = ${REALM_NAME}

[realms]
    ${REALM_NAME} = {
        kdc = localhost
        admin_server = localhost
    }

[domain_realm]
    .${DOMAIN_NAME} = ${REALM_NAME}
    ${DOMAIN_NAME} = ${REALM_NAME}
EOL

# Creating initial database
kdb5_util -r ${REALM_NAME} create -s << EOL
${MASTER_PASS}
${MASTER_PASS}
EOL

# Creating admin principal
kadmin.local -q "addprinc root/admin@${REALM_NAME}" << EOL
${KADMIN_PASS}
${KADMIN_PASS}
EOL

# Start services
kadmind
krb5kdc

tail -f /var/log/krb5kdc.log