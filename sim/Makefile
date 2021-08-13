rtlm3="../rtl/dvsd_8216m3.v"
rtlm4="../rtl/dvsd_8216m4.v"
rtlm5="../rtl/dvsd_8216m5.v"
tbm4="../tb/dvsd_8216m4_tb.v"

help:
	@ echo =================================================
	@ echo 
	@ echo	"Make		Target"
	@ echo -------------------------------------------------	
	@ echo	"test1		test dvsd_8216m4_tb"
	@ echo 	"test2		test dvsd_8216m4_test"
	@ echo 	"test3		test dvsd_8216m3_test"
	@ echo 	"test5		test dvsd_8216m5_test"
	@ echo 
	@ echo =================================================

test1:
	iverilog $(tbm4)
	vvp a.out

test2:
	iverilog $(rtlm4)
	vvp a.out

test3:
	iverilog $(rtlm3)
	vvp a.out

test5:
	iverilog $(rtlm5)
	vvp a.out