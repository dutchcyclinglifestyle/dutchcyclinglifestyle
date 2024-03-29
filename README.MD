<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/dutchcyclinglifestyle/dutchcyclinglifestyle">
    <img src="assets/img/bike.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Dutch Cycling Lifestyle</h3>

  <p align="center">
    Develop a happier and healthier street with our cycling lifestyle.
    <br />
    <a href="#getting-started"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://www.holland.com/global/tourism/get-inspired/current/cycling-lifestyle.htm">Read more</a>
    ·
    <a href="https://github.com/dutchcyclinglifestyle/dutchcyclinglifestyle/issues">Report Bug</a>
    ·
    <a href="https://github.com/dutchcyclinglifestyle/dutchcyclinglifestyle/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#background">Background</a></li>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#python-notebook">Python Notebook</a></li>
        <li><a href="#prerequisites-for-local-installation">Prerequisites for local installation</a></li>
        <li><a href="#local-installation">Local installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#credits">Credits</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

### Background

The Dutch cycling lifestyle tool is a project by the Netherlands Board of Tourism & Conventions. The tool is designed to generate images of a happier and healthier street with our cycling lifestyle. The tool is built using a combination of AI and urban planning to create a vision of a future street that's more suitable for cycling.

The tool transforms existing streets into a vision of a future street that's more suitable for cycling. See the example below:

|              Before               |              After               |
| :-------------------------------: | :------------------------------: |
| ![](assets/img/street_before.png) | ![](assets/img/street_after.png) |

### Built with

The tool relies mainly on the technology called [Stable Diffusion](https://github.com/CompVis/stable-diffusion). This technology allows us to generate images using text prompts on a model that's trained on a lot of images.

This model also allows us to "inpaint" in a certain area of an existing picture. To determine this area we use a segmentation model that detects the road and vehicles in the original images.

|  Segmentation of unwanted objects  |
| :--------------------------------: |
| ![](assets/img/street_segment.png) |

All of this is built in a framework especially for the mentioned technology, called [ComfyUI](<[http://](https://github.com/comfyanonymous/ComfyUI)>), which is a visual node-based interface for AI image processing. This framework allows us to easily modify the workflow and add new features.

<!-- GETTING STARTED -->

## Getting Started
### Python Notebook

When you don't have the necessary GPUs in your machine, you can run the python notebook in Google Colab and follow the usage guide from the [workflow](#workflow) section.

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/dutchcyclinglifestyle/dutchcyclinglifestyle/blob/main/dutchcyclinglifestyle.ipynb)

### Prerequisites for local installation

#### AMD GPUs (Linux only)

AMD users can install rocm and pytorch with pip if you don't have it already installed, this is the command to install the stable version:

```bash
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm5.7
```

This is the command to install the nightly with ROCm 6.0 which might have some performance improvements:

```bash
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm6.0
```

#### NVIDIA

Nvidia users should install stable pytorch using this command:

```bash
pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu121
```

This is the command to install pytorch nightly instead which might have performance improvements:

```bash
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu121
```

#### Troubleshooting

If you get the "Torch not compiled with CUDA enabled" error, uninstall torch with:

```bash
pip uninstall torch
```

And install it again with the command above.

### Local installation

Clone this repository and run the `install.sh` script to install the ComfyUI framework in this folder. This script will also install the necessary (recommended) models and nodes for the tool to work with our workflow.

```bash
git clone https://github.com/dutchcyclinglifestyle/dutchcyclinglifestyle.git

cd dutchcyclinglifestyle

./install.sh
```

## Usage

Use the `run.sh` script to start the server. You can also run the server by running `python main.py` from the ComfyUI directory.

```bash
./run.sh
```

Then drag and drop the [original workflow](./workflows/original_workflow.json) json file into the ComfyUI manager UI or use the `Load workflow` button on the right side of the UI.

Add your image to the `Load Image` node and run the workflow. To infer using API, read the [example code](https://github.com/comfyanonymous/ComfyUI/blob/master/script_examples/basic_api_example.py) of ComfyUI for further explanation.

Please note that the first run of the workflow will take a while to download the required Segment Anything models. After the download is complete, you can start using the tool at full speed.

### Workflow

<figure>
  <img src="./workflows/original_workflow.png" alt="original ComfyUI workflow">
</figure>

<small>
  You can also save the workflow image and drag and drop it into the ComfyUI manager UI to load the workflow.
</small>

## Roadmap

- [x] Start of development (June 2023)
- [x] Launch Dutch cycling lifestyle tool (October 2023)
- [x] One million generated images (January 2024)
- [x] Open source the tool (February 2024)
- [ ] Cease operation of the tool due to insufficient funding (June 2024)
- [ ] Hackathon at [Urban Future Rotterdam](https://urban-future.org/event/uf24-rotterdam-launch/uf24/) (June 2024)

## Contributing

This project is open source and we welcome contributions. Report bugs and feature requests using the [issues](https://github.com/dutchcyclinglifestyle/dutchcyclinglifestyle/issues) tab, or request new features by forking the project and creating a pull request.

The best way to contribute is to modify the ComfyUI workflow and add new nodes to the tool and submit a pull request with a new workflow json file in the `workflows` folder. Installs of the added custom nodes, or new models can be added to the `install.sh` script.

<!-- LICENSE -->

## License

Distributed under the MIT License. See LICENSE.txt for more information.

## Contact

<div 
  style="display: flex;flex-direction: column;align-items: center;font-size: 12px;text-align:center">
  <img src="assets/img/nbtc_logo_full.svg" alt="Logo" width="104" height="31" style="margin-bottom:12px">
  <p>
  The Netherlands Board of Tourism & Conventions (NBTC)
  <br>
  <a href="mailto:cyclinglifestyle@holland.com">cyclinglifestyle@holland.com</a>
  </p>
</div>

<!-- Credits -->

## Credits

This project is developed by [Handpicked Lab](https://www.handpickedagencies.com/lab) (creative technology & backend), [IN10](https://www.in10.nl/) (frontend), [HumanKind](https://www.humankind.city/) (concept & urban planning) and the Netherlands Board of Tourism & Conventions (NBTC).

Special thanks to the following people for their contributions:

- [Jascha Huisman](https://www.linkedin.com/in/jaschahuisman/)
- [Samet Yilmaz](https://www.linkedin.com/in/samet-yilmaz/)
- [Lior Steinberg](https://www.linkedin.com/in/liorsteinberg/)
- [Frank Kwanten](https://www.linkedin.com/in/frank-kwanten-1239049/)

<!-- ACKNOWLEDGMENTS -->

## Acknowledgments

This tool couldn't have been made without the following open source projects:

- [Stable Diffusion](https://www.github.com/CompVis/stable-diffusion)
- [ComfyUI](https://www.github.com/comfyanonymous/ComfyUI)
- [ComfyUI Segment Anything](https://github.com/storyicon/comfyui_segment_anything.git)
- [Segment Anything](https://segment-anything.com/)
- [Grounded Segment Anything](https://github.com/IDEA-Research/Grounded-Segment-Anything)
- [Grounding DINO](https://github.com/IDEA-Research/GroundingDINO)
