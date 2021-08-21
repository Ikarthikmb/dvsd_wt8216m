
if { [info exist ::env(MAGIC_EXT_USE_GDS)] && $::env(MAGIC_EXT_USE_GDS) } {
	gds read $::env(CURRENT_GDS)
} else {
	lef read /home/drako/applications/vsdflow/work/tools/openlane_working_dir/openlane/pdks/sky130A/libs.ref/sky130_fd_sc_hd/techlef/sky130_fd_sc_hd.tlef
	if {  [info exist ::env(EXTRA_LEFS)] } {
		set lefs_in $::env(EXTRA_LEFS)
		foreach lef_file $lefs_in {
			lef read $lef_file
		}
	}
	def read /openLANE_flow/designs/dvsd_8216m9/runs/20-08_18-30/results/routing/17-dvsd_8216m9.def
}
load dvsd_8216m9 -dereference
cd /openLANE_flow/designs/dvsd_8216m9/runs/20-08_18-30/results/magic/
extract do local
extract no capacitance
extract no coupling
extract no resistance
extract no adjust
if { ! 0 } {
	extract unique
}
# extract warn all
extract

ext2spice lvs
ext2spice -o /openLANE_flow/designs/dvsd_8216m9/runs/20-08_18-30/results/magic/dvsd_8216m9.spice dvsd_8216m9.ext
feedback save /openLANE_flow/designs/dvsd_8216m9/runs/20-08_18-30/logs/magic/30-magic_ext2spice.feedback.txt
# exec cp dvsd_8216m9.spice /openLANE_flow/designs/dvsd_8216m9/runs/20-08_18-30/results/magic/dvsd_8216m9.spice

