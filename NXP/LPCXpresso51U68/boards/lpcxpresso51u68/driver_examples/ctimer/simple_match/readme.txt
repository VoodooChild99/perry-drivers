Overview
========
The CTimer Example project is to demonstrate usage of the KSDK ctimer driver.
In this example, the match feature of the CTimer is used to toggle the output level.

Toolchain supported
===================
- IAR embedded Workbench  9.30.1
- Keil MDK  5.37
- MCUXpresso  11.6.0
- GCC ARM Embedded  10.3.1

Hardware requirements
=====================
- Mini/micro USB cable
- LPCXpresso51U68 board
- Personal Computer

Board settings
==============
No special settings are required.

Prepare the Demo
================
1.  Connect a micro USB cable between the PC host and the CMSIS DAP USB port (J6) on the board
2.  Open a serial terminal with the following settings (See Appendix A in Getting started guide for description how to determine serial port number):
    - 115200 baud rate
    - 8 data bits
    - No parity
    - One stop bit
    - No flow control
3.  Download the program to the target board.
4.  Either press the reset button on your board or launch the debugger in your IDE to begin running the demo.

Running the demo
================
The log below shows example output of the CTimer driver simple match demo in the terminal window, you could also monitor the output on J2-5.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CTimer match example to toggle the output on a match
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
