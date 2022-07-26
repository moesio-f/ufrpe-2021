- [Chapter 2: The Physical Layer](#chapter-2-the-physical-layer)
  - [2.5 Digital Modulation and Multiplexing](#25-digital-modulation-and-multiplexing)
    - [2.5.1 Baseband Transmission](#251-baseband-transmission)
    - [2.5.2 Passband Transmission](#252-passband-transmission)
    - [2.5.3 Frequency Division Multiplexing](#253-frequency-division-multiplexing)
    - [2.5.4 Time Division Multiplexing](#254-time-division-multiplexing)
    - [2.5.5 Code Division Multiplexing](#255-code-division-multiplexing)

---
# Chapter 2: The Physical Layer

> The **Physical Layer** defines electrical, timing, and other interfaces by which bits are sent as signals over channels. It is the foundation on which the network is built.

## 2.5 Digital Modulation and Multiplexing

> The process of converting between bits and signals that represent them is called **digital modulation**.
> 
> Channels are ofter shared by multiple signals, **multiplexing** allows to use the same physical medium to be shared between multiple signals.

### 2.5.1 Baseband Transmission

The most straightforward form of digital modulation, it represents bits as a positive and negative "voltages".

> We call the rate at which the signal changes the **symbol rate** (also called **baud rate**) to distinguish it from the **bit rate** (symbol rate multiplied by the number of bits per symbol).

### 2.5.2 Passband Transmission

Passband uses the same idea as baseband, however it shifts the starting up or down from 0. This can be achieved by different methods:

  - Amplitude Shift Keying (ASK)
  - Frequency Shift Keying (FSK)
  - Phase Shift Keying (PSK)


### 2.5.3 Frequency Division Multiplexing

> FDM takes advantage of passband transmission to share a channel. It divides the spectrum into frequency bands, with each user having exclusive possession of some band.

### 2.5.4 Time Division Multiplexing

> TDM uses turns to send signals over a channel.

### 2.5.5 Code Division Multiplexing

> CDM is a form of spread spectrum communication inn which a narrowband signal is spread out over wider frequency band.