# 8-bit RISC CPU
***Description*** <br>
RISC (Reduced Instruction Set Computer) is a method of designing modern processors. In this project, I designed and implemented a simple RISC CPU with a 3-bit opcode and a 5-bit operand, meaning there are 8 types of instructions and 32 address spaces.<br>
The processor operates based on clock and reset signals. Using on Arty Z7 Development Board or equivalent others.<br><br>
***System Functions*** <br>
Loading instructions from Memory.<br>
Decoding instructions.<br>
Getting operands from Memory if needed.<br>
Implementing instructions, processing operations if needed.<br>
Storing results to Memory or Accumulator. <br><br>
***Modules***<br>
*Program Counter*: Storing address register of program.<br>
*Memory*: Storing and Providing instructions and data for program.<br>
*Instruction Register*: Processing instructions.<br>
*Accumulator Register*: Processing data from ALU.<br>
*ALU*: Processing data from Memory, Accumulator and Opcode of Instructions.<br>
.
## Functional specification
### Program Counter:
- The counter is used for tracking instruction execution and the program's status.
- The counter is enabled when it receives an up pulse of CLK.
- When the reset signal is high, the counter returns to zero.
- The width of the counter is 5.
- The counter can load any number. On the other hand, it operates normally.


### Memory
- The Memory stores instructions and data.
- 5-bit address and 8-bit data.
- signals for read/write.
- The Memory is enabled when it receives an up pulse of CLK.

### Register
- Input signal has 8-bit width.
- The reset signal is synchronized and high triggered
- The register is enabled when it receives an up pulse of CLK.

### Controller
- The controller manages control signals of CPU included *Fetching* and *Executing* Instructions.
- The reset signal is synchronized and high triggered.
- The controller is enabled when it receives an up pulse of CLK.
- 3-bit opcode signal is equilevent to ALU.
- The controller has 8 statuses

### ALU
- The ALU executes arithmetic operations.
- The ALU executes operations on 8 bit operands. The result is 8 bits and 1-bit *is_zero*.
- The 3-bit opcode input are going to decide which operation will be executed:<br>
  *HLT* (000): Stop the program.<br>
  *SKZ* (001): If the result of ALU is equal zero then skipping next instruction, else the program is executed normally.<br>
  *ADD* (010): Adding the value from Accumulator to the data memory value then the result is returned to Accumulator.<br>
  *AND* (011): Executing the AND operation of the value from Accumulator to the data memory value then the result is returned to Accumulator.<br>
  *XOR* (100): Executing the XOR operation of the value from Accumulator to the data memory value then the result is returned to Accumulator.<br>
  *LDA* (101): Reading the value from address and writing it to Accumulator.<br>
  *STO* (110): Writing data from Accumulator to the address of instructions.<br>
  *JMP* (111): Jumping without any condition, Jumping to the address of instruction and sequently executing next instructions.<br>

## Architecture design

