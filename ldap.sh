# 389 without ssl and 636 with ssl
ldapsearch -x -H ldap://localhost:389 -b "" -s base "(objectClass=*)" namingContexts
ldapsearch -H ldap://host:389 -b "dc=domain-two,dc=domain-one" "(objectClass=*)" -x | more