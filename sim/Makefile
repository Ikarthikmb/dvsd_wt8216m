rtlm3="../rtl/dvsd_8216m3.v"
rtlm9="../rtl/dvsd_8216m9.v"
tbm3="../tb/dvsd_8216m3_tb.v"
tbm9="../tb/dvsd_8216m9_tb.v"


help:
	@ echo ======================================================
	@ echo 
	@ echo	"Make		Description"
	@ echo ------------------------------------------------------	
	@ echo 	"test1		test dvsd_8216m3 code"
	@ echo 	"			- 8 bit Dada mutiplier circuit"
	@ echo 	"test2 		to test dvsd_8216m9 code"
	@ echo 	"			- Built in mutiplier"
	@ echo 	
	@ echo ======================================================

test1:
	time iverilog $(tbm3)
	vvp a.out
	gtkwave dvsd_8216m3_tb.vcd
	
test2:
	time iverilog $(tbm9)
	vvp a.out
	gtkwave dvsd_8216m9_tb.vcd