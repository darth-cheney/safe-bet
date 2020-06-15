I represent a basic CPU Register in the RISC-V environment.

I have the following instance variables:
registerName -- A symbol that identifies the register. Used in any CPU consumer
value -- The bits currently stored in the register. Note that the size of the value depends upon the class-side specification of xlen, which is the integer size being used. For example if RV32I (base) is the instruction set being used, then the size of each register will be 32 bits and the class-side xlen will respond with 32.
  
To retrieve my current value, simply send the message #value. To set my current value, simply pass an integer to #value:. Note that when setting my value, I will consume the lower xlen bits of whatever integer is passed in without reporting such trimming.

I initialize to xlen zeros.
