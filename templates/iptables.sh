    iptables --flush

    # example IPs--replace as appropriate
    export INTERNAL_NETWORK_RANGE=10.0.0.0/8
    export GATEWAY_INTERNAL_IP=10.0.0.1
    export GATEWAY_EXTERNAL_IP=192.168.1.2
    export PIVOTALCF_IP=10.0.0.2
    export HA_PROXY_IP=10.0.0.10

    # iptables forwarding rules including loopback
    iptables -A FORWARD -i eth0 -j ACCEPT
    iptables -A FORWARD -o eth0 -j ACCEPT
    iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
    iptables -t nat -A POSTROUTING -d $HA_PROXY_IP -s $INTERNAL_NETWORK_RANGE \
        -p tcp --dport 80 -j SNAT --to $GATEWAY_INTERNAL_IP

        iptables -t nat -A POSTROUTING -d $HA_PROXY_IP -s $INTERNAL_NETWORK_RANGE \
                -p tcp --dport 443 -j SNAT --to $GATEWAY_INTERNAL_IP

        iptables -t nat -A PREROUTING -d $GATEWAY_EXTERNAL_IP -p tcp --dport 443 -j DNAT \
                 --to $HA_PROXY_IP
    

        iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8443 -j DNAT \
              --to $PIVOTALCF_IP:443
        iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT \
              --to $HA_PROXY_IP:80
        iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 22 -j DNAT \
              --to $PIVOTALCF_IP:22
        iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 8080 -j DNAT \
              --to $PIVOTALCF_IP:80

        # DNS iptables rules
        iptables -A INPUT -p udp --sport 53 -j ACCEPT
        iptables -A INPUT -p udp --dport 53 -j ACCEPT
        iptables -A OUTPUT -p udp --sport 53 -j ACCEPT
        iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
 #       iptables -A INPUT -p udp -j DROP
 #       iptables -A OUTPUT -p udp -j DROP


iptables -N LOGGING
iptables -A INPUT -j LOGGING
iptables -A OUTPUT -j LOGGING
