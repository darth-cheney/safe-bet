I represent a Memory interface designed for use in the RISC-V simulation environment.
  
My contents are byte addressable, beginning at 0-indexed addresses. I should be initialized with a fixed size by using my class-side constructor #size:.
  
To access the byte value at a given 0-indexed address, send the #byteAt: message.
To access X number of bytes starting at a given 0-indexed address, send the #bytesAt:numBytes.
  
To store a byte at a 0-indexed address, send the #byteAt:put: message. To store a bytearray starting at a particular 0-indexed starting point, send #bytesAt:put: