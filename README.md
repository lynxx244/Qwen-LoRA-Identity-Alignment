# 🚀 基于 LLaMA-Factory 的 Qwen2.5-7B 指令微调与认知对齐实战

## 📝 项目简介
本项目通过 LoRA 微调技术，实现了对 Qwen2.5-7B 模型的人格重塑与垂直领域知识注入。通过调整优化器步长与学习率，成功将训练 Loss 从 3.35 降低至 0.45。

---

## 🚀 快速开始 (Quick Start)

## 1. 环境准备
确保您的机器已安装 Python 3.8+ 和 CUDA 环境，执行以下命令安装 LLaMA-Factory：
```bash
git clone [https://github.com/hiyouga/LLaMA-Factory.git](https://github.com/hiyouga/LLaMA-Factory.git)
cd LLaMA-Factory
pip install -e ".[metrics,bitsandbytes]"

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
 图一为初步结果，图二为进一步训练结果
<img width="1223" height="639" alt="image" src="https://github.com/user-attachments/assets/6249ac74-a8ee-43d5-9bb8-6a872dfa40e1" />


<img width="1203" height="325" alt="train_result" src="https://github.com/user-attachments/assets/323a1e0a-7eb4-4cdd-a72a-967ad3650be3" />
