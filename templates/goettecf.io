$TTL 86400
@   IN  SOA     ns1.goettecf.io. root.goettecf.io (
        2013042201  ;Serial
        3600        ;Refresh
        1800        ;Retry
        604800      ;Expire
        86400       ;Minimum TTL
)
; Specify our two nameservers
                IN      NS              ns1.goettecf.io.
; Resolve nameserver hostnames to IP, replace with your two droplet IP addresses.
ns1             IN      A               10.0.0.1

; Define hostname -> IP pairs which you wish to resolve
pivotalcf               IN      A       10.0.0.2
*                       IN      A       10.0.0.10
