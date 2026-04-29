# EFT2Obs setup
# ----------------

# Clone the repo
git clone https://github.com/ajgilbert/EFT2Obs.git

# Install the tools
./scripts/setup_mg5.sh
./scripts/setup_rivet.sh
source local/rivetenv.sh

# Add the main models
./scripts/setup_model_SMEFTsim3.sh
./scripts/setup_model_SMEFTatNLO.sh
./scripts/setup_model_HEL.sh
./scripts/setup_rivet_plugins.sh
