
# Install ComfyUI
git clone https://github.com/comfyanonymous/ComfyUI ./ComfyUI
cd ComfyUI

# Install dependencies
pip install -r requirements.txt

# Download checkpoints
# === Realistic Vision (basemodel) https://civitai.com/models/4201/realistic-vision-v60-b1 === #
curl -L https://civitai.com/api/download/models/130072 -o ./models/checkpoints/model.safetensors

# Download embeddings
# === Easy Negative (embedding) https://civitai.com/models/7808/easynegative === #
curl -L https://civitai.com/api/download/models/9208 -o ./models/embeddings/easynegative.safetensors
# === Unrealistic Dream (embedding) https://civitai.com/models/72437 === #
curl -L https://civitai.com/api/download/models/77169 -o ./models/embeddings/unrealisticdream.pt

# Download Lora's
# === No lora's used yet === #

# Install custom nodes
cd ./custom_nodes/

# === ComfyUI Segment Anything (SAM) === #
git clone https://github.com/storyicon/comfyui_segment_anything.git
cd comfyui_segment_anything
pip install -r requirements.txt
cd .. # back to custom_nodes
cd .. # back to ComfyUI

# Prepare default input
# === Image input === #
cp ../assets/img/street_before.png ./input/streetview_4qry54b_1.jpg