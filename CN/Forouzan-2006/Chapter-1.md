- [Chapter 1: Introduction](#chapter-1-introduction)
  - [1.1 Data Communications](#11-data-communications)
    - [Data Flow](#data-flow)
  - [1.2 Networks](#12-networks)
    - [Network Criteria](#network-criteria)
    - [Physical Structures](#physical-structures)
    - [Network Models](#network-models)
    - [Categories of Networks](#categories-of-networks)
    - [Interconnection of Networks: Internetwork](#interconnection-of-networks-internetwork)
  - [1.4 Protocols and Standards](#14-protocols-and-standards)

---
# Chapter 1: Introduction

## 1.1 Data Communications

> **Data** is any information presented in an agreed form by the parties.

> **Data communication** is the exchange of data between two devices via some transmission medium.

> **Delivery**: systems must deliver the data to the correct destination.
> 
> **Accuracy**: systems must deliver data accurately/
> 
> **Timeliness**: systems must deliver data in a timely manner.
> 
> **Jitter**: the variation in the packet arrival time should be controlled.

There are 5 components to data communication systems:

1. **Message**: the information to be transmitted.
2. **Sender**: the device that send the message.
3. **Receiver**: the device that receives the message.
4. **Transmission medium**: physical path by which the message travels from sender to receiver.
5. **Protocol**: set of rules that govern the data communication.

### Data Flow

> In **simplex mode**, the communication is unidirectional.
> 
> In **half-duplex mode**, the communication is bi-directional but only one device can transmit at a time.
> 
> In **full-duplex mode**, both devices can transmit and receive messages simultaneously.

## 1.2 Networks

> A **network** is a set of devices (referred to as *nodes*) connected by communication links.

### Network Criteria

1. **Performance**: can be measured by different metrics.
2. **Reliability**: frequency of failure, recover time, robustness, etc.
3. **Security**: unauthorized access, data protection, etc.

### Physical Structures

- **Type of Connection**:
  - *Point-to-point*: dedicated link between two devices.
  - *Multi-point*: more than 2 devices share the same link.
- **Physical Topology**:
  - *Mesh*: each device has a dedicated point-to-point link to every other device.
  - *Star*: each device has a dedicated point-to-point link to a central controller (*hub*).
  - *Bus*: multi-point connection which contains a single link for all devices.
  - *Ring*: each device has only two point-to-point links to devices on "sides".
  - *Hybrid*: multi-topology combination.


### Network Models

> The two best known models are the **Internet model**, five layers protocol stack, and **OSI (Open Systems Interconnection) model**, seven layers.

### Categories of Networks

- **Local Area Network (LAN)**: single office building.
- **Wide Area Network (WAN)**: country, continent, potentially whole world.
- **Metropolitan Area Network (MAN)**: intermediary between LAN and WAN.

### Interconnection of Networks: Internetwork

> the *internet* is a network where two or more distinct networks are connected.

## 1.4 Protocols and Standards

The key elements of a protocol are:

- **Syntax**: structure or format of the data.
- **Semantics**: the meaning of each section of the data.
- **Timing**: when data should be sent and how fast.

> Standards provide guidelines to manufactures, vendors, government agencias, and other service providers.

- **De facto** standards are widely used but haven't been approved by an organization body.
- **De jure** standards have been legislated by an officially recognized body.