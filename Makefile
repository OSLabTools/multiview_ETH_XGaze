# Makefile

# Define variables
TOOL_NAME = multiview_eth_xgaze
VENV = multiview_eth_xgaze
VENV_DIR = ./envs/$(VENV)
DEV = false
MACHINE_SPECIFICS = machine_specific_paths.toml

# Define variables for third party venvs
ifeq ($(OS), Windows_NT)
	PYTHON_EXE = python
	VENV_EXE_DIR = $(VENV_DIR)/Scripts

else
	PYTHON_EXE = python3.10
	VENV_EXE_DIR = $(VENV_DIR)/bin
endif


# Download Assets
ASSETS = assets

OUTPUTS_DIR = ../multiview-eth-xgaze_outputs
ASSETS_DIR = ./assets

ASSETS_URL = https://keeper.mpdl.mpg.de/f/f33a8106c0ba49d5aaa9/?dl=1


# -----------------------------------
# Full setup: installation + download
# -----------------------------------
.PHONY: all
all: download_assets install

# ------------------------
# Clean up an installation
# ------------------------
.PHONY: clean
clean:
#	@echo "Cleaning pycache."
#	@rm -rf __pycache__
	@echo "Deleting virtual environment $(VENV_DIR)."
	@rm -rf $(VENV_DIR)

# ------------------------
# Create a separator
# ------------------------
.PHONY: create_separator
create_separator:
	@echo ""
	@echo "*********************************************"
	@echo ""

# ----------------------
# Download keeper assets
# ----------------------
download_assets: $(ASSETS_DIR)

$(ASSETS_DIR):
	@make create_separator
	@echo "Downloading keeper assets..."
	@mkdir -p $(ASSETS_DIR)
ifeq ($(OS), Windows_NT)
	@curl -L -o $(ASSETS).zip $(ASSETS_URL)
else
	@wget --progress=bar:force $(ASSETS_URL) -O $(ASSETS).zip
endif
	@unzip -j $(ASSETS).zip -d $(ASSETS_DIR)
	@rm $(ASSETS).zip
	@echo "Checkpoint files downloaded to $(ASSETS_DIR)/$(ASSETS)"
	
# -------------------
# Install multiview-eth-xgaze
# -------------------
.PHONY: install
install: $(VENV_EXE_DIR)/activate

# Install the virtual environment
$(VENV_EXE_DIR)/activate: pyproject.toml
#	start clean
	@make clean

#	create virtual environment
	@make create_separator
	@echo "Creating virtual environment in $(VENV_DIR)..."
	@$(PYTHON_EXE) -m venv $(VENV_DIR)
	
ifeq ($(DEV), false)
# 	basic installation
	@echo "Installing $(TOOL_NAME)..."
	@$(VENV_EXE_DIR)/pip install torch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cu118
	@$(VENV_EXE_DIR)/pip install . -c constraints.txt
else
# 	developer installation
	@echo "Installing $(TOOL_NAME) editable for developers..."
#   torch is required for the evaluation (part of optional dependencies)
	@$(VENV_EXE_DIR)/pip install torch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0 --index-url https://download.pytorch.org/whl/cu118
	@$(VENV_EXE_DIR)/pip install -e ".[dev]" -c constraints.txt
endif
	@echo "$(TOOL_NAME) installed in $(VENV_DIR) successfully."


