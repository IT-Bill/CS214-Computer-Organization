## Problem 1.

For a direct-mapped cache design with a 32-bit address, the following bits of the address  are used to access the cache.

#### 1. What is the cache block size (in words)?

$2^{5-2}=8$ words

#### 2. How many entries does the cache have?

$2^{5}=32$ entries

#### 3. Ratio

$\frac{22+3+256}{256} \approx 1.09$

#### 4. 

4

#### 5.

4/12=0.33

![image-20230604140715322](C:\Users\itbil\AppData\Roaming\Typora\typora-user-images\image-20230604140715322.png)

#### 6. 

![image-20230604143611426](C:\Users\itbil\AppData\Roaming\Typora\typora-user-images\image-20230604143611426.png)

We only list the non-empty cache blocks.



## Problem 2.

1. - offset: 2-0
   - index: 4-3
   - tag: 31-5

2. ![image-20230604145843503](C:\Users\itbil\AppData\Roaming\Typora\typora-user-images\image-20230604145843503.png)

3. - offset: 1-0
   - index: None
   - tag: 31-2
4. ![image-20230604150538532](C:\Users\itbil\AppData\Roaming\Typora\typora-user-images\image-20230604150538532.png)

5.

|                                                              |           |
| ------------------------------------------------------------ | --------- |
| Base CPI, No Memory Stalls                                   | 1.5       |
| Processor Speed                                              | 2 GHz     |
| Main Memory Access Time                                      | 100 ns    |
| First Level Cache Miss-Rate pre Instruction                  | 7%        |
| Second Level Cache, Direct-Mapped Speed                      | 12 cycles |
| Global Miss Rate with second level cache, direct-mapped      | 3.5%      |
| second level cache, eight-way set associative speed          | 28 cycles |
| global miss rate with second level cache, eight-way set associative | 1.5%      |

1 )  only a first level cache

clock cycle time: $0.5ns$

main memory access CPI = 200

Finally CPI = $1.5 + 7\% * 200 = 15.5$

2 ) a second level direct-mapped cache

 0.93 × 1.5 + 0.035 × 13.5 + 0.035 × 213.5 = 9.34

3 )  a second level eight-way set associative cache

 0.93 × 1.5 + 0.055 × 29.5 + 0.015 × 229.5 = 0.93*1.5+1.6225+3.4425=6.46

## Problem3

1. 9-bit
2. 0x375 = 0011 0111 0101

![image-20230604155146151](C:\Users\itbil\AppData\Roaming\Typora\typora-user-images\image-20230604155146151.png)

correct data is 0x365

## Problem4

1. - offset: 11-0
   - VPN: 31-12

2. ![image-20230604161815493](C:\Users\itbil\AppData\Roaming\Typora\typora-user-images\image-20230604161815493.png)

