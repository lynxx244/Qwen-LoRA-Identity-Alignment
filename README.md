# Qwen-LoRA-Identity-Alignment
基于 LLaMA-Factory 的 Qwen 7B 模型指令微调与认知对齐实战”。
# 🚀 基于 LLaMA-Factory 的 Qwen2.5-7B 指令微调与认知对齐实战

## 📝 项目简介
本项目基于 LLaMA-Factory 框架，在有限算力（单卡 24GB 显存 / RTX 3050Ti 模拟测试）环境下，完成了开源大模型 Qwen2.5-7B 的 LoRA 指令微调。通过构建定制化数据集，成功实现了模型的“身份认知对齐（Identity Alignment）”与垂直领域知识注入。

## 🛠️ 核心技术栈
- **基础模型:** Qwen/Qwen2.5-7B-Instruct
- **微调框架:** LLaMA-Factory (HuggingFace, PEFT)
- **训练技术:** LoRA (Low-Rank Adaptation), 半精度训练 (FP16), 梯度累积 (Gradient Accumulation)
- **部署环境:** Linux (AutoDL), SSH, SCP跨平台通信

## 💡 核心工程突破
1. **解决显存 OOM 瓶颈：** 采用 `batch_size=2` 配合 `gradient_accumulation_steps`，有效平衡了内存占用与梯度下降的稳定性。
2. **克服灾难性遗忘与幻觉：** 针对极小样本数据集，动态调整学习率至 `2e-4` 并进行 `epochs=40` 的过拟合训练，成功将 Loss 从 3.35 收敛至 0.45，实现 100% 身份对齐。
3. **网络链路优化：** 配置 `USE_MODELSCOPE_HUB=1` 环境变量，解决跨国拉取 HuggingFace 权重的网络超时问题。

## 📂 仓库结构
- `mydataset.json` : 用于认知重塑与知识注入的多轮对话数据集。
- `train_lora.sh` : SFT 训练启动脚本（包含所有核心超参数配置）。
- `test_chat.sh` : 本地 CLI 对话推理脚本。


## 🎯 效果展示
<img width="1127" height="166" alt="loss_value" src="https://github.com/user-attachments/assets/be64e841-4db0-4cf6-ac8e-640fe2dfd34c" />

<img width="1203" height="325" alt="train_result" src="https://github.com/user-attachments/assets/323a1e0a-7eb4-4cdd-a72a-967ad3650be3" />
