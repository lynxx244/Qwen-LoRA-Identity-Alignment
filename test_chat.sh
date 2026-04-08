#!/bin/bash

# 设置国内镜像源加速
export USE_MODELSCOPE_HUB=1

echo "💬 [Chat] 正在加载微调后的 LoRA 模型进行交互..."
echo "📂 适配器路径: ./train_results"

# 启动对话界面
llamafactory-cli chat \
    --model_name_or_path qwen/Qwen2.5-7B-Instruct \
    --adapter_name_or_path ./train_results \
    --template qwen \
    --finetuning_type lora
