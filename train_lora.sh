#!/bin/bash

# 设置国内镜像源加速
export USE_MODELSCOPE_HUB=1

echo "🚀 [Start] 正在启动 Qwen2.5-7B LoRA 微调..."
echo "📊 数据集: my_custom_data"
echo "📈 目标输出路径: ./train_results"

# 启动微调指令
# 注意：请确保在 LLaMA-Factory 根目录下运行此脚本
llamafactory-cli train \
    --stage sft \
    --do_train \
    --model_name_or_path qwen/Qwen2.5-7B-Instruct \
    --dataset my_custom_data \
    --template qwen \
    --finetuning_type lora \
    --output_dir ./train_results \
    --overwrite_output_dir \
    --per_device_train_batch_size 2 \
    --gradient_accumulation_steps 1 \
    --lr_scheduler_type cosine \
    --logging_steps 1 \
    --save_steps 100 \
    --learning_rate 2e-4 \
    --num_train_epochs 40.0 \
    --plot_loss \
    --fp16

echo "✅ [Finished] 训练任务已完成！"
