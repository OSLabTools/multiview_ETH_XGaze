# Multiview ETH-XGaze 

## Overview

This repository is for 3D gaze estimation in a multi-view setup. 

The current implementation is designed to run the directory through [NICE toolbox](https://github.com/OSLabTools/nicetoolbox), and the configuration file required to run Multiview ETH-XGaze is created automatically there. 

To be able to run Multiview ETH-XGaze through NICE toolbox, you don't need to make a sparate installation here, the installation can be done through NICE Toolbox. 

**Next**: We will provide the configuration file to run Multiview ETH-XGaze independently.

## Installation

### Prerequisites:

#### Operating System

Windows or Linux (e.g. Ubuntu 18.04/20.04)

### GPU 

NVIDIA GPU with CUDA 11-compatible 

#### CUDA Toolkit 11.8

Installation file (Make) assumes that Cuda 11.8 is already installed in your system. 

Please find installation instructions on the official websites: for [Windows](https://docs.nvidia.com/cuda/cuda-installation-guide-microsoft-windows/index.html) and [Linux Ubuntu](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html).

#### Python 3.10

Please find the download links under the [official python](https://www.python.org/downloads/) pages.
If you are a Windows user, please add python to your `PATH` variable as explained on [educative.io](https://www.educative.io/answers/how-to-add-python-to-path-variable-in-windows).

#### Git 

Ensure that Git is installed on your system. You can find installation instructions [here](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

#### On Windows: Make

Multiview ETH-XGaze uses Makefiles for simple installation process. Follow these steps to install `make` on Windows for use with **Git Bash**:


**Step 1:** Download `make` for Windows
- Go to the official **ezwinports** SourceForge page:  
   🔗 [https://sourceforge.net/projects/ezwinports/files/](https://sourceforge.net/projects/ezwinports/files/)
- Download the latest version of **make**:  
   - Look for a file named:  `make-<latest_version>-without-guile-w32-bin.zip`

**Step 2:** Extract the ZIP File
- Unzip the downloaded `make-<latest_version>-without-guile-w32-bin.zip` file.

**Step 3:** Copy the Files to Git Bash’s MinGW64 Folder
- Navigate to: `C:\Program Files\Git\mingw64`
- Copy the contents of the extracted folder (copy all folders) into `C:\Program Files\Git\mingw64`. 
- **IMPORTANT:** Do NOT overwrite or replace any existing files.

**📌 Note:**  
After copying the files, you must **restart Git Bash** for the changes to take effect.

### How-To-Install

Clone the repository and navigate to its directory:

Inside the `multiview_eth_xgaze` directory, open a terminal and run:

```bash
make
```

Development options can be installed via
```bash
make DEV=true
```

## Attribution

The work extends the [ETH-XGaze](https://github.com/xucong-zhang/ETH-XGaze).
Licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).

- Files under the folder `multiview_eth_xgaze\eth_xgaze\` are based on the original code, with minimal changes (e.g., added `__init__.py` for packaging)
- Files `gaze_estimator.py`, `landmarks.py`, and `xgaze_utils.py` are based on original work but have been modified by the authors.
- File `inference.py` is the multi-view implementation and created by the authors.

## Authors

Carolin Schmitt<sup>1</sup>, Gökce Ergün<sup>1</sup>, Xuchong Zhang<sup>1, 2</sup>

The authors are with the <sup>1</sup>Optics and Sensing Laboratory at Max-Planck Institute for Intelligent Systems and the <sup>2</sup>Department of Computer Science at ETH Zurich.

## License

[Multiview ETH-XGaze](https://github.com/OSLabTools/multiview_eth_xgaze) © 2025 by Carolin Schmitt, Gökce Ergün, Xucong Zhang is licensed under 
[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/?ref=chooser-v1), see [LICENSE.md](./LICENSE.md).

## Citation

If you use or build upon this work, please cite the original [ETH-XGaze](https://github.com/xucong-zhang/ETH-XGaze) publication:

```bibtex
@inproceedings{ETHXGaze,
  author    = {Xucong Zhang and Seonwook Park and Thabo Beeler and Derek Bradley and Siyu Tang and Otmar Hilliges},
  title     = {ETH-XGaze: A Large Scale Dataset for Gaze Estimation under Extreme Head Pose and Gaze Variation},
  year      = {2020},
  booktitle = {European Conference on Computer Vision (ECCV)}
}
```
As well as this GitHub page:
```bibtex
@misc{MultiviewETHGaze,
  author = {Carolin Schmitt and Gökce Ergün and Xuchong Zhang},
  title = {Multiview ETH-XGaze},
  year = {2025},
  howpublished = {\url{hhttps://gitlab.tuebingen.mpg.de/gergn/multiview_eth_xgaze}}
}
```

Copyright 2025, Max Planck Society / Optics and Sensing Laboratory - Max Planck Institute for Intelligent Systems