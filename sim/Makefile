rtlm3="../rtl/dvsd_8216m3.v"
rtlm4="../rtl/dvsd_8216m4.v"
rtlm5="../rtl/dvsd_8216m5.v"
rtlm7="../rtl/dvsd_8216m7.v"
rtlm71="../rtl/dvsd_8216m71.v"
rtlm9="../rtl/dvsd_8216m9.v"
rtltest="../rtl/test.v"
tbm3="../tb/dvsd_8216m3_tb.v"
tbm4="../tb/dvsd_8216m4_tb.v"
tbm9="../tb/dvsd_8216m9_tb.v"


help:
	@ echo =================================================
	@ echo 
	@ echo	"Make		Description"
	@ echo -------------------------------------------------	
	@ echo	"test1		test dvsd_8216m4_tb"
	@ echo 	"test2		test dvsd_8216m4_test"
	@ echo 	"test3		test dvsd_8216m3_test"
	@ echo 	"test5		test dvsd_8216m5_test"
	@ echo 	"test7		test dvsd_8216m7 test"
	@ echo 	"test71		test dvsd_8216m71 test"
	@ echo 	"test9 		test dvsd_8216m9 test"
	@ echo 
	@ echo =================================================

test1:
	iverilog $(tbm4)
	vvp a.out

test2:
	iverilog $(rtlm4)
	vvp a.out

test3:
	iverilog $(tbm3)  # $(rtlm3)
	vvp a.out

test5:
	iverilog $(rtlm5)
	vvp a.out

test7:
	iverilog $(rtlm7)
	vvp a.out

test71:
	iverilog $(rtlm71)
	vvp a.out
test9:
	iverilog $(rtlm9)
	iverilog $(tbm9)
	vvp a.out

testtest:
	iverilog $(rtltest)
	vvp a.out
