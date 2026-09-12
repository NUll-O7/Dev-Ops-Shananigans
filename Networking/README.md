# Linux networking playground

This directory pairs common network commands with captured output images. The commands help answer four basic questions:

1. Which interfaces and addresses exist?
2. Which route will outbound traffic take?
3. Which DHCP and DNS settings are active?
4. Can a remote host be reached?

The screenshots in [`assets/`](assets/README.md) show example output. Your output will differ by machine, interface name, network, and time.

## Interface and route inspection

### `ip a`

Shows interfaces, IPv4/IPv6 addresses, link state, and MAC addresses.

```bash
ip a
```

![ip a output](assets/image1.png)

### `ip route`

Shows the routing table and default gateway.

```bash
ip route
```

![ip route output](assets/image2.png)

### `hostname -i`

Prints the address or addresses associated with the host name. It is a quick check, not a complete interface inventory.

```bash
hostname -i
```

![hostname output](assets/image3.png)

## DHCP information

### `nmcli device show`

NetworkManager can show connection details, including DHCP lease information and the DHCP server identifier:

```bash
nmcli device show <interface>
```

Replace `<interface>` with a name from `ip a`. The captured example is in [`assets/image5.png`](assets/image5.png).

## DNS information

### `dig`

`dig` shows the answer for a domain and the DNS server that answered it:

```bash
dig example.com
```

![dig output](assets/image4.png)

### `resolvectl status`

Shows global and per-interface DNS settings managed by systemd-resolved:

```bash
resolvectl status
```

![resolvectl output](assets/image6.png)

## Connectivity

### `ping`

Sends ICMP echo requests and reports reachability and round-trip time:

```bash
ping -c 4 google.com
```

![ping output](assets/image7.png)

A failed ping does not prove that every network path is broken. Firewalls can block ICMP while HTTP or DNS still works. Compare the result with `dig` and a request to a known HTTP endpoint.

## Troubleshooting order

Use the commands in this order when a host cannot reach a service:

1. `ip a`: confirm the interface is up and has an address.
2. `ip route`: confirm a default route exists.
3. `resolvectl status` or `dig`: confirm DNS settings and resolution.
4. `ping`: test basic reachability when ICMP is allowed.
5. Test the actual service protocol, such as `curl` for HTTP.

Do not copy addresses from the screenshots into a live configuration. They document one machine at one point in time.
