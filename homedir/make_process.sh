# Shortcut script to run the multi-step EFT2Obs setup in one go
# Args: $1 = process name
#       $2 = reweighting points
#       $3 = coupling value

# Setup the process
./scripts/setup_process.sh $1

# Define the points
python scripts/make_config.py -p $1 -o cards/$1/config.json  --pars $2  --def-val $3 --def-sm 0.0 --def-gen 0.0

# Make the cards
python scripts/make_param_card.py -p $1 -c cards/$1/config.json -o cards/$1/param_card.dat
python scripts/make_reweight_card.py cards/$1/config.json cards/$1/reweight_card.dat

# Make the gridpack (LO)
./scripts/make_gridpack.sh $1

