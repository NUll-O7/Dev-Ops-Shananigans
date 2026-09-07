# Networking Playground

## IP & Interface Commands

### ip a
1. Shows the IP address, subnet mask, and MAC address assigned to your network interface.
![ip a Output](assets/image1.png)

### ip route
1. Displays the routing table, including your default gateway. Confirms the router's IP that all outbound traffic gets sent through.
![ip route output](assets/image2.png)

### hostname -i
1. Quick one-line print of your machine's current IP address(es). Useful as a fast sanity check without parsing full interface output.
![hostname -i output](assets/image3.png)

## DHCP Commands

### nmcli device show 'Network-Name'
1. Displays full connection details for an interface managed by NetworkManager, including the DHCP lease info and server identifier.
![nmcli output](assets/image5.png)

## DNS Commands

### dig 'site-url'
1. Resolves a domain name to its IP address and shows which DNS server answered. Demonstrates the name-to-IP translation step before any connection is made.
![dig output](assets/image4.png)

### resolvectl status
1. resolvectl status is a command used in Linux operating systems to display the current global and per-interface DNS resolution settings managed by systemd-resolved.
![resolvectl output](assets/image6.png)

## Connectivity

### ping google.com
1. Sends ICMP echo requests to test basic reachability and measure round-trip time. Confirms the destination is up and responding before deeper troubleshooting.

![ping Output](assets/image7.png)