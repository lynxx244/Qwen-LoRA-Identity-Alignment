export USE_MODELSCOPE_HUB=1

cd /root/LLaMA-Factory && llamafactory-cli train \
    --stage sft \
    --do_train \
    --model_name_or_path qwen/Qwen2.5-7B-Instruct \
    --dataset my_custom_data \
    --template qwen \
    --finetuning_type lora \
    --output_dir /root/train_results \
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