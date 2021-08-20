# Openlane Workflow

## Step 1: Clone OpenLane

```sh
<<<<<<< HEAD
git clone https://github.com/efabless/openlane
=======
git clone https://github.com/efabless/openlane.git openlane
>>>>>>> 413d05ce4633dbedf3eba8414876694db7fe5521
cd openlane 
make openlane 
make pdk
```
## Step 2: Fix pip dependency issue

> Go through this step only if you get pip dependency error

```
cd pdks
```

After this there should be  `skywater-pdk` folder, remove the present `skywater-pdk` since it has issues and we are going to replace it with the following by

```sh
sudo rm -r skywater-pdk

git clone https://github.com/google/skywater-pdk.git skywater-pdk
cd ../
```

Now, install all the pdk packages at `/openlane` folder using

```sh
make pdk
```

## Step 3: Test

On successful completion of previous step, lets test it by

```sh
make test
```

which shall display the "successful" message. 

> **Note:** Go to next steps only after having the **successful test**.

**Next steps**

## Step 4: Opening OpenLane in Docker

Lets first check if docker is installed, if you can see the docker version 19.* and above then docker is present and go to next step else install docker manually

```sh
docker --version
```

## Step 5: Test hello-world

You can test if docker is working properly by running hello-world in docker using

```sh
docker run hello-world
```

## Step 6: Make mount

Once you are sure the docker is present, you have to make mount of the current files in **openlane**, which is simply done by

```sh
make mount
```

after this a `bash` terminal is visible which looks diferent in your case, where you can test your original design or choose from the pre loaded designs.[By default all the designs are in "openlane/designs" folder]

```sh
bash-4:$
```

## Step 7: Open OpenLane Docker container and test

To open this "openlane workflow bash" terminal 

```
docker run -it efabless/openlane:latest
```

Now lets test a design which is already present in `openlane/designs` type 

```sh
<<<<<<< HEAD
bash-4:$ flow.tcl -design spm -init_design_config 
```

It shall take some time and the flow should go without errors. Now, you can load(or copy) your design into `openlane/design` folder and run using openlane workflow container. 
=======
bash-4:$ flow.tcl -design spm -interactive 
```

It shall take some time and the flow should go without errors. Now, you can load(or copy) your design into `openlane/design` folder and run using openlane workflow container. 

For a new design you have to add a config file first which can be done by `-init_design_config` and continue with workflow

```sh
bash-4:$ flow.tcl -design my_design -src designs/my_design/design_name.v -init_design_config -interactive 
```

## References:

* https://github.com/google/skywater-pdk
* https://github.com/efabless/openlane
* https://www.youtube.com/watch?v=d0hPdkYg5QI
>>>>>>> 413d05ce4633dbedf3eba8414876694db7fe5521
