# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.0-base

# install custom nodes into comfyui
RUN comfy node install --exit-on-fail seedvr2_videoupscaler@2.5.18
RUN comfy node install --exit-on-fail rgthree-comfy@1.0.2512071717
RUN comfy node install --exit-on-fail cg-use-everywhere@7.5.2

# download models into comfyui
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors --relative-path models/vae --filename ae.safetensors
# RUN # Could not find URL for ema_vae_fp16.safetensors
RUN comfy model download --url https://huggingface.co/numz/SeedVR2_comfyUI/resolve/main/ema_vae_fp16.safetensors --relative-path models/vae --filename ema_vae_fp16.safetensors
# RUN # Could not find URL for z_image_turbo_bf16.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors --relative-path models/diffusion_models --filename z_image_turbo_bf16.safetensors
# RUN # Could not find URL for qwen_3_4b.safetensors
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors --relative-path models/vae --filename qwen_3_4b.safetensors
# RUN # Could not find URL for seedvr2_ema_3b-Q4_K_M.gguf
RUN comfy model download --url https://huggingface.co/cmeka/SeedVR2-GGUF/resolve/main/seedvr2_ema_3b-Q4_K_M.gguf --relative-path models/SEEDVR2 --filename seedvr2_ema_3b-Q4_K_M.gguf
# RUN # Could not find URL for lileviepie.safetensors
RUN comfy model download --url https://huggingface.co/anondev120/lileviepie/resolve/main/lileviepie.safetensors --relative-path models/loras --filename lileviepie.safetensors
# RUN # Could not find URL for lenovo_z.safetensors
RUN comfy model download --url https://huggingface.co/Danrisi/Lenovo_UltraReal_Z_Image/resolve/main/lenovo_z.safetensors --relative-path models/loras --filename lenovo_z.safetensors

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/