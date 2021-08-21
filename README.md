
# 1. 8 bit binary Multiplier using sky130 PDK with OpenLane

**Contents:**

<!-- @import "[TOC]" {cmd="toc" depthFrom=2 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [1. 8 bit binary Multiplier using sky130 PDK with OpenLane](#1-8-bit-binary-multiplier-using-sky130-pdk-with-openlane)
  - [1.1. Verification of the Muliplier](#11-verification-of-the-muliplier)
    - [1.1.1. Design Verification](#111-design-verification)
  - [1.2. OpenLane Flow](#12-openlane-flow)
    - [1.2.1. Preparation](#121-preparation)
    - [1.2.2. Synthesis](#122-synthesis)
    - [1.2.3. Floor Planning](#123-floor-planning)
    - [1.2.4. Placement](#124-placement)
  - [1.3. References:](#13-references)
  - [1.4. Acknowledgements:](#14-acknowledgements)

<!-- /code_chunk_output -->

---

The binary multiplier uses two 8-bit inputs(A and B) to produce 16-bit output. You can use the make file commads to reproduce this project. To check available commads run `make help` inside `sim` directory.

## 1.1. Verification of the Muliplier 

To verify the rtl code

```
make test9
```

```
time	| A			| B			| M				 
0		| 0010 0100	| 0011 0101	| 0000 0111 0111
5		| 1000 0001	| 0101 1110	| 0010 1111 0101
10		| 0000 1001	| 1101 0110	| 0000 0111 1000
20		| 1111 1111	| 1111 1111	| 1111 1110 0000
```

### 1.1.1. Design Verification

Design is verified with GTKwave

![gtkwave out](fig/8216m9_lane12.png)


## 1.2. OpenLane Flow

### 1.2.1. Preparation 

Start the OpenLane workflow within a docker container. Adding the project to the designs folder. Then lets open the design with openlane

```
flow.tcl -design dvsd_8216m9 -init_design_config
```

![preparation of the design](fig/8216m9_lane1.png)

![configuration file](fig/8216m9_lane2.png)

To run the design with openlane

```
flow.tcl -design dvsd_8216m9
```

### 1.2.2. Synthesis

![Flow Completion Dialog](fig/8216m9_lane3.png)

Viewing the syntheiszed rtl code with yosys.

```
xdot tmp/synthesis/hierarchy.dot
xdot tmp/synthesis/post_techmap.dot
```

![Hierarchy block](fig/8216m9_lane5.png)

![synthesized block](fig/8216m9_lane4.png)


### 1.2.3. Floor Planning 

To run floor planning in openlane

```sh
run_floorplanning

magic -T $PDK_ROOT/sky130A/libs.tech/magic/sky130A lef read tmp/merged.lef def read results/floorplan/dvsd_8216m9.floorplan.def
```

![Floor planning magic command](fig/8216m9_lane7.png)

![Floor planning](fig/8216m9_lane6.png)

### 1.2.4. Placement 

To run placement 

```sh
run_placement
```
To view placement 

![Placement magic command](fig/8216m9_lane9.png)

![Placement](fig/8216m9_lane8.png)

![](fig/8216m9_lane10.png)

Converting to spice

![](fig/8216m9_lane11.png)



## 1.3. References:

* openlane: https://github.com/efabless/openlane
* The-OpenROAD-Project: https://github.com/The-OpenROAD-Project/)
* openlane-workshop: https://gitlab.com/gab13c/openlane-workshop#about-the-project)
* Magic VLSI: http://opencircuitdesign.com/magic/)


## 1.4. Acknowledgements:

* [Kunal Ghosh](https://github.com/kunalg123), Co-founder, VSD Corp. Pvt. Ltd.