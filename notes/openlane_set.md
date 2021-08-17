# Openlane

```
git clone https://github.com/efabless/openlane
cd openlane 
make openlane 
cd pdks
```
remove the present `skywater-pdk` since it has issues and replace with the following by

```
git clone https://github.com/google/skywater-pdk.git skywater-pdk
cd ..
```

Now, install the pdk packages

```
make pdk
```

On successfull completion test it by

```
make test
```
which shall desplay the successfull message.

### Next steps

Opening OpenLane in Docker Conainer:

```
make mount
```
after this a `bash` terminal is visible where you can test your design.

So lets test a design.

```
flow.tcl -design spm -init_design_config 
```
