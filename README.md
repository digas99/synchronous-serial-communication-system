# synchronous-serial-communication-system
Project of **Digital Systems Lab** classes, made by [Carlos Costa](https://github.com/carlosrjpcosta) and [Diogo Correia](https://github.com/digas99)


Computers and Telematics Engineering at Universidade de Aveiro

## 1. System Specifications
A synchroous serial communication system sends data from a *Master* node to a *Slave* node, using two signals: the *data*, that contains the information that is meant to be transfered; the *clock*, that determines at what pace the information is sent.

In this case, as specified by the guidelines of the project in hand, this is an unidirectional system (*symplex*), which means that the information is sent from *Master* to *Slave*, only, and not the other way around. 

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

## 2. System's Architecture

![sys_arch](https://i.imgur.com/pWnNX6h.png)

### 2.1. State Machine
![state_machine](https://i.imgur.com/rdB7Ta6.png)

### 2.2. Truth Table
![truth_table](https://i.imgur.com/N26F6Mg.png)

## 3. Development and Validation
This system works based on a state machine structure so, writing VHDL code of an FSM (Finite State Machine) is the starting point.

Then, the architecture has to be implemented, either through a block diagram builder, or simply by coding it in VHDL.

**In this initial state**, it is expected a low level of complexity of the system, since the focus is to elaborate the FSM.

An FPGA (field-programmable gate array) is will be used to output the system's updates.

The *Data Size* is defined outside of the FPGA's environment.

The FPGA should behave as the following:
- Display of initial and final *Data Size* values on HEX [7..4] exits;
- Usage of a button to activate data input;
- Green LED goes on everytime there is data input;
- Red LED goes on everytime *checksum* outputs an error;

**On a second state of the project**, it is exptected that HEX [3..0] exits output the *checksum error* value and the initial *Data Size* should be set through a button.

**On a final state**, as required by the project's guidelines, it should be implemented a *MuliSlave* communication, where the user can choose to which *Slave* will the *Master* send the data.

## 4. User Guide
![fpga](https://i.imgur.com/tdeiHR1.png)

(Image from [https://www.mercadolivre.com.br/](https://www.mercadolivre.com.br/))

**1 -** Data input button

**2/3 -** Payload size setting buttons

**4 -** Green LED that goes on everytime data is successfully transfered from *Master* to *Slave*

**5 -** Red LED that goes on everytime there is an error

**6 -** Displays error message

**7 -** Size of last data transmission

**8 -** Size of first data transmission
