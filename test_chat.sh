export USE_MODELSCOPE_HUB=1

cd /root/LLaMA-Factory && llamafactory-cli chat \
    --model_name_or_path qwen/Qwen2.5-7B-Instruct \
    --adapter_name_or_path /root/train_results \
    --template qwen \
    --finetuning_type lora