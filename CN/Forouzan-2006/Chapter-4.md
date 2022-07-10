- [Chapter 4: Digital Transmission](#chapter-4-digital-transmission)
  - [4.3 Transmission Modes](#43-transmission-modes)

---
# Chapter 4: Digital Transmission

## 4.3 Transmission Modes

- **Parallel Transmission**: send multiple bits as a group, can be implemented through multiple "wires" or lines.
- **Serial Transmission**: send one bit after the other, reducing the cost to have multiple channels/lines.

- **Asynchronous transmission**: the timing of the signal in unimportant.
  - Send 1 start bit at the beginning and 1 or mor stop bits at the end of the byte. It mean *asynchronous at byte level*.
- **Synchronous transmission**: bits are sent one after another without start or stop bit or gaps. The receiver must group the bits.
- **Isochronous transmission**: guarantees that the data arrive at a fixed rate.