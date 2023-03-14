# Exercise 1 - Basic Networking

- **arp -a** 


```
Interface: 192.168.56.1 --- 0x10 
  Internet Address      Physical Address      Type
  192.168.56.255        ff-ff-ff-ff-ff-ff     static
  224.0.0.2             01-00-5e-00-00-02     static
  224.0.0.22            01-00-5e-00-00-16     static
  224.0.0.251           01-00-5e-00-00-fb     static
  224.0.0.252           01-00-5e-00-00-fc     static
  239.255.255.250       01-00-5e-7f-ff-fa     static
  255.255.255.255       ff-ff-ff-ff-ff-ff     static

Interface: 192.168.1.119 --- 0x21
  Internet Address      Physical Address      Type
  192.168.1.1           00-5f-67-55-ba-30     dynamic
  192.168.1.7           6a-2c-c5-06-fd-e1     dynamic
  192.168.1.127         00-d8-61-fc-1c-44     dynamic
  192.168.1.255         ff-ff-ff-ff-ff-ff     static
  224.0.0.2             01-00-5e-00-00-02     static
  224.0.0.22            01-00-5e-00-00-16     static
  224.0.0.251           01-00-5e-00-00-fb     static
  224.0.0.252           01-00-5e-00-00-fc     static
  239.255.255.250       01-00-5e-7f-ff-fa     static
  255.255.255.255       ff-ff-ff-ff-ff-ff     static

Interface: 172.22.240.1 --- 0x40
  Internet Address      Physical Address      Type
  172.22.242.27         00-15-5d-24-73-63     dynamic
  172.22.255.255        ff-ff-ff-ff-ff-ff     static
  224.0.0.2             01-00-5e-00-00-02     static
  224.0.0.22            01-00-5e-00-00-16     static
  224.0.0.251           01-00-5e-00-00-fb     static
  239.255.255.250       01-00-5e-7f-ff-fa     static
```


- **route PRINT**




```
IPv4 Route Table
===========================================================================
Active Routes:
Network Destination        Netmask          Gateway       Interface  Metric
          0.0.0.0          0.0.0.0      192.168.1.1    192.168.1.119     25
        127.0.0.0        255.0.0.0         On-link         127.0.0.1    331
        127.0.0.1  255.255.255.255         On-link         127.0.0.1    331
  127.255.255.255  255.255.255.255         On-link         127.0.0.1    331
     172.22.240.0    255.255.240.0         On-link      172.22.240.1    271
     172.22.240.1  255.255.255.255         On-link      172.22.240.1    271
   172.22.255.255  255.255.255.255         On-link      172.22.240.1    271
      192.168.1.0    255.255.255.0         On-link     192.168.1.119    281
    192.168.1.119  255.255.255.255         On-link     192.168.1.119    281
    192.168.1.255  255.255.255.255         On-link     192.168.1.119    281
     192.168.56.0    255.255.255.0         On-link      192.168.56.1    281
     192.168.56.1  255.255.255.255         On-link      192.168.56.1    281
   192.168.56.255  255.255.255.255         On-link      192.168.56.1    281
        224.0.0.0        240.0.0.0         On-link         127.0.0.1    331
        224.0.0.0        240.0.0.0         On-link      192.168.56.1    281
        224.0.0.0        240.0.0.0         On-link     192.168.1.119    281
        224.0.0.0        240.0.0.0         On-link      172.22.240.1    271
  255.255.255.255  255.255.255.255         On-link         127.0.0.1    331
  255.255.255.255  255.255.255.255         On-link      192.168.56.1    281
  255.255.255.255  255.255.255.255         On-link     192.168.1.119    281
  255.255.255.255  255.255.255.255         On-link      172.22.240.1    271
===========================================================================
```

- **google dns server**


```
tracert 8.8.8.8

Tracing route to dns.google [8.8.8.8]
over a maximum of 30 hops:

  1    <1 ms    <1 ms    <1 ms  192.168.1.1
  2     1 ms     1 ms    <1 ms  10.110.0.2
  3     *        *        *     Request timed out.
  4     *        *        *     Request timed out.
  5     9 ms     9 ms     9 ms  212-39-66-222.ip.btc-net.bg [212.39.66.222]
  6    10 ms    10 ms    10 ms  216.239.62.49
  7     9 ms    11 ms     9 ms  209.85.254.243
  8     9 ms     8 ms     8 ms  dns.google [8.8.8.8]
  ```

- **Why would you need to use the ping command ?** 
```
     Checking if the host is alive, latency, troubleshooting connection, PoD(ping of death)
```


| Protocol          | TCP | UDP | PORT  |
| ----------------- | --- | --- | ----- |
| HTTP              | x   |     | 80    |
| SNMP              |     | x   | 161   |
| HTTPS             | x   |     | 443   |
| DNS Client        |     | x   | 53    |
| DNS Zone Transfer | x   |     | 53    |
| SMTP              | x   |     | 587   |
| SSH               | X   |     | 22    |
| TELNET            | x   |     | 23    |
| FTP               | x   |     | 20,21 |
| MYSQL             | x   |     | 3306  |
| MSSQL             | x   |     | 1433  |
| PostresSQL        | x   |     | 5432  |
| RDP               | x   |     | 3389  |
| NTP               |     | x   | 123   |
| NFS               | x   |     | 2049  |

---

# Exercise 2 – TCP/IP Basics 


![network](img/network.png)














