
# 8 bit binary Multiplier using sky130 PDK with OpenLane

The binary multiplier uses two 8-bit inputs(A and B) to produce 16-bit output. You can use the make file commads to reproduce this project. To check available commads run `make help`.

## Verification of the Muliplier 

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

## OpenLane Flow

Start the OpenLane workflow within a docker container. Adding the project to the designs folder. Then lets open the design with openlane

```
flow.tcl -design dvsd_8216m9 -init_design_config
```

![preparation of the design](fig/8216m9_lane1.png)

![configuration file](fig/8216m9_lane1.png)

To run the design with openlane

```
flow.tcl -design dvsd_8216m9
```

![Flow Completion Dialog](fig/8216m9_lane3.png)

Viewing the syntheiszed rtl code with yosys.

```
xdot tmp/synthesis/hierarchy.dot
xdot tmp/synthesis/post_techmap.dot
```

![Hierarchy block](fig/8216m9_lane5.png)

![synthesized block](fig/8216m9_lane4.png)

### Floor Planning 

To run floor planning in openlane

```sh
run_floorplanning

magic -T $PDK_ROOT/sky130A/libs.tech/magic/sky130A lef read tmp/merged.lef def read results/floorplan/dvsd_8216m9.floorplan.def
```

![Floor planning magic command](fig/8216m9_lane7.png)

![Floor planning](fig/8216m9_lane6.png)

### Placement 

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

Output Verification:

![gtkwave out](fig/8216m9_lane12.png)
