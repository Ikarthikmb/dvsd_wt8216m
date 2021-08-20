# Layout Design of a Modified 8-bit Dadda Multiplier using 3:2 Compressors

## Introduction

Process Design Kit (PDK) is the interface between the CAD designers and the foundry. The PDK is a collection of files used to model a fabrication process for the EDA tools used in designing an IC. PDK’s are traditionally closed-source and hence are the limiting factor to open-source Digital ASIC Design. Google and Skywater have broken this stigma and published the world’s first open-source PDK on June 30th, 2020. This breakthrough has been a catalyst for open-source EDA tools[^1].

[^1]: https://gitlab.com/gab13c/openlane-workshop#about-the-project


## CMOS AND Gate

**Statement:** The output of the AND gate is HIGH when two inputs are HIGH.

Port | Type 
--- | ---
a1  | input
a2  | input 
y   | output

**Equation:** 
```
y = a1 * a2
```

**Output File report:**

```
a2      a1      y
0       0       0
0       1       0
1       0       0
1       1       1
```
## CMOS XOR-XNOR Gate

**Statement:** 

* The output of XOR gate is LOW when both the inputs are similar and HIGH when both inputs are not similar.
* The output of XNOR gate is HIGH when both the inputs are similar and LOW when both inputs are not similar.

Port | Type
--- | --- 
a1  | input
a2  | input
xor_o   | output 
xnor_o   | output 

**Equations:** 

```
xor_o = a1 ^ a2
xnor_o = ~(a1 ^ a2)
```

**Output File Report:** 

```
b       |a      |xor_o  |xnor_o
--------|-------|-------|-------
0       |0      |0      |1
0       |1      |1      |0
1       |0      |1      |0
1       |1      |0      |1
```

## CMOS Multiplexer

**Statement:** The output is dependent on the state of SELECT pin, if SELECT pin is LOW I0 is selectes else I1 is selected.

Port | Type
--- | --- 
i0  | input
i1  | input
s   | input
y   | output 

**Equations:** 

```
y = (s' * I0) + (s * I1)
```

**Output File Report:** 
```
s       |i1     |i0     |y
--------|-------|-------|-------
0       |0      |0      |0
0       |0      |1      |1
0       |1      |0      |0
0       |1      |1      |1
1       |0      |0      |0
1       |0      |1      |0
1       |1      |0      |1
1       |1      |1      |1
```

## 3:2 Compressor

**Statement:** A 3:2 compressor reduces a 3-bit input to 2-bit output.

Port | Type
--- | ---
a0  | input
a1  | input
a2  | input
sout    | output
cout    | output

**Equations:** 

```
sout = (a0 a1' + a0' a1) a2' + (a0 a1' + a0' a1)' a2
cout = a0 a1 + a2
```

**Output File Report:** 

```
a2      a1      a0      sout    cout
0       0       0       0       0
0       0       1       1       0
0       1       0       1       0
0       1       1       0       1
1       0       0       1       1
1       0       1       0       1
1       1       0       0       1
1       1       1       1       1
```

## 8-bit Dadda Multiplier

**Statement**: Dadda tree algorithm is similar to the Wallace tree reduction but consumes less gates.

Port | Type 
---	| ---
A	| 16 bit Input
B	| 16 bit Input
M	| 16 bit Output

# OpenLANE Flow

## RTL Synthesis

![DVSD_8216M3](../fig/dvsd_8216m3_blocky_seg1.png)

## STA

## DFT 

## Floorplannng

## Placement
 
## CTS

## Optimization

# Resources

OpenLANE: https://openlane-docs.readthedocs.io/en/rtd-develop/#installation-notes
OpenROAD: https://vlsicad.ucsd.edu/Publications/Conferences/371/c371.pdf

