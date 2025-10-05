# FABRIC

## Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

## Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision | Serial Number |
| --- | ---- | ---- | ------------- | -------- | -------------------------- | ------------- |
| FABRIC | l3leaf | leaf1a-dc-bld1 | 192.168.88.30/24 | vEOS-lab | Provisioned | - |
| FABRIC | l3leaf | leaf1b-dc-bld1 | 192.168.88.31/24 | vEOS-lab | Provisioned | - |
| FABRIC | l3leaf | leaf2-dc-bld1 | 192.168.88.32/24 | vEOS-lab | Provisioned | - |
| FABRIC | spine | spine1-dc-bld1 | 192.168.88.16/24 | vEOS-lab | Provisioned | - |
| FABRIC | spine | spine2-dc-bld1 | 192.168.88.17/24 | vEOS-lab | Provisioned | - |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

### Fabric Switches with inband Management IP

| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

## Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | leaf1a-dc-bld1 | Ethernet1 | spine | spine1-dc-bld1 | Ethernet1 |
| l3leaf | leaf1a-dc-bld1 | Ethernet2 | spine | spine2-dc-bld1 | Ethernet1 |
| l3leaf | leaf1a-dc-bld1 | Ethernet3 | mlag_peer | leaf1b-dc-bld1 | Ethernet3 |
| l3leaf | leaf1a-dc-bld1 | Ethernet4 | mlag_peer | leaf1b-dc-bld1 | Ethernet4 |
| l3leaf | leaf1b-dc-bld1 | Ethernet1 | spine | spine1-dc-bld1 | Ethernet2 |
| l3leaf | leaf1b-dc-bld1 | Ethernet2 | spine | spine2-dc-bld1 | Ethernet2 |
| l3leaf | leaf2-dc-bld1 | Ethernet1 | spine | spine1-dc-bld1 | Ethernet3 |
| l3leaf | leaf2-dc-bld1 | Ethernet2 | spine | spine2-dc-bld1 | Ethernet3 |

## Fabric IP Allocation

### Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 192.168.5.0/25 | 128 | 12 | 9.38 % |

### Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| leaf1a-dc-bld1 | Ethernet1 | 192.168.5.1/31 | spine1-dc-bld1 | Ethernet1 | 192.168.5.0/31 |
| leaf1a-dc-bld1 | Ethernet2 | 192.168.5.3/31 | spine2-dc-bld1 | Ethernet1 | 192.168.5.2/31 |
| leaf1b-dc-bld1 | Ethernet1 | 192.168.5.5/31 | spine1-dc-bld1 | Ethernet2 | 192.168.5.4/31 |
| leaf1b-dc-bld1 | Ethernet2 | 192.168.5.7/31 | spine2-dc-bld1 | Ethernet2 | 192.168.5.6/31 |
| leaf2-dc-bld1 | Ethernet1 | 192.168.5.9/31 | spine1-dc-bld1 | Ethernet3 | 192.168.5.8/31 |
| leaf2-dc-bld1 | Ethernet2 | 192.168.5.11/31 | spine2-dc-bld1 | Ethernet3 | 192.168.5.10/31 |

### Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 192.168.1.0/25 | 128 | 3 | 2.35 % |
| 192.168.1.128/25 | 128 | 2 | 1.57 % |

### Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| FABRIC | leaf1a-dc-bld1 | 192.168.1.3/32 |
| FABRIC | leaf1b-dc-bld1 | 192.168.1.4/32 |
| FABRIC | leaf2-dc-bld1 | 192.168.1.5/32 |
| FABRIC | spine1-dc-bld1 | 192.168.1.129/32 |
| FABRIC | spine2-dc-bld1 | 192.168.1.130/32 |

### VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------------ | ------------------- | ------------------ | ------------------ |
| 192.168.10.0/25 | 128 | 3 | 2.35 % |

### VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| FABRIC | leaf1a-dc-bld1 | 192.168.10.3/32 |
| FABRIC | leaf1b-dc-bld1 | 192.168.10.3/32 |
| FABRIC | leaf2-dc-bld1 | 192.168.10.5/32 |
