# synchronous-serial-communication-system
Project of Digital Systems Lab classes, made by Carlos Costa and Diogo Correia

## 1. System Specifications
A synchroous serial communication system sends data from a Master node to a Slave node, using two signals: the *data*, that contains the information that is meant to be transmitted; the *clock*, that determines at what pace the information is sent.

In this case, as specified by the guidelines of the project in hand, this is an unidirectional system (*symplex*), which means that the information is sent from Master to Slave, only, and not the other way around. 

This system can be divided into four parts:
- **Start of Frame:** a bit assigned with the value 0, which represents the beginning of the data transmission;
- **Size:** it contains the information on the number of bytes that will be used by the **Payload**;
- **Payload:** carries the data that is being sent from Master to Slave;
- **Checksum:** it detects eventual errors, through the sum of all the nibbles (*1 nibble = 4 bytes*) sent in the **Size** and **Payload** blocks;

Logic blocks being used:
- Shift Register;
- Clock;
- Adder;
- Comparator;
- State Machine;
- RAM;

## 2. System Architecture

![sys_arch](https://i.imgur.com/pWnNX6h.png)

### 2.1. State Machine
![state_machine](https://i.imgur.com/rdB7Ta6.png)

### 2.2. Truth Table
![truth_table](https://i.imgur.com/N26F6Mg.png)
