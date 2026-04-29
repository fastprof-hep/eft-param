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
For subsequent sessions, repeat the last two commands (The image creation needs to be done only once).

## Install EFT2Obs

All the required base packages should be available within the image. Access to other packages are available through a /cvmfs mount.
One still needs to install madgraph and related tools
```
source install.sh
```
## Run an example
```
cd EFT2Obs
source make_process.sh zh-SMEFTsim3 SMEFT:4,5,7,8,9,21,22,23,24,25,26,27,30 0.01
```
and then follow the EFT2Obs instructions for generation
```
export HIGGSPRODMODE=ZH
python scripts/run_gridpack.py --gridpack gridpack_zh-SMEFTsim3.tar.gz -s 1 -e 500 \
  -p HiggsTemplateCrossSectionsStage1,HiggsTemplateCrossSections -o test-zh
yodamerge -o test-zh/Rivet.yoda test-zh/Rivet_*
python scripts/get_scaling.py -c cards/zh-SMEFTsim3/config.json [--nlo] \
  -i test-zh/Rivet.yoda --hist "/HiggsTemplateCrossSections/pT_V" \
  --save json,txt,tex --translate-tex resources/translate_tex.json \
  --rebin 0,10,20,30,40,50,60,70,80,90,100,120,140,160,180,200,250,300,350,400
python scripts/makePlot.py --hist HiggsTemplateCrossSections_pT_V.json -c cards/zh-SMEFTsim3/config.json --x-title "p_{T}(Z) [GeV]" --title-left "qq #rightarrow Hl^{+}l^{-}" --title-right "SMEFTsim3" --ratio 0.9,1.95 --draw chw=0.005:4 chwb=0.005:2 chb=0.005:8 chbox=0.05:12 --show-unc --y-min 1E-9 --translate resources/translate_root.json
```
