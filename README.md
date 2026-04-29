# eft-param
Code to generate EFT samples and compute parameterizations

# Contents

The package has two main parts:
- *Docker*: a set of scripts and configs to create a docker image in which to run the generation
- *EFT2Obs*: scripts to run the generation within the [EFT2Obs](https://github.com/ajgilbert/EFT2Obs)

# Instructions

## Set up and run the image

- Install docker on the local machine
- Create the docker image ```source docker/create_image.sh```
- Run the docker image ```source docker/run_image.sh```
- Within the image, set up the local environment ```source setup.sh```

## Install EFT2Obs

All the required base packages should be available within the image. Access to other packages are available through a /cvmfs mount.
One still needs to install madgraph and related tools
```
source install.sh
```
