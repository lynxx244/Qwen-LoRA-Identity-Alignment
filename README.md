# 🚀 基于 LLaMA-Factory 的 Qwen2.5-7B 指令微调与认知对齐实战

## 📝 项目简介
本项目基于 **LLaMA-Factory** 框架，对开源大语言模型 **Qwen2.5-7B-Instruct** 进行了 LoRA 指令微调。项目核心目标是实现模型的“身份认知对齐（Identity Alignment）”，使其在特定语境下产生预设的人格化回复，并成功克服了在有限显存环境下的训练瓶颈。



## 🚀 快速开始 (Quick Start)

### 1. 环境准备
确保您的机器已安装 Python 3.8+、CUDA 环境及相关的显卡驱动，执行以下命令安装核心框架：

```bash
git clone [https://github.com/hiyouga/LLaMA-Factory.git](https://github.com/hiyouga/LLaMA-Factory.git)
cd LLaMA-Factory
pip install -e ".[metrics,bitsandbytes]"
```

## 2. 数据集配置 (关键步骤)

1.  将本仓库中的 `mydataset.json` 拷贝至 LLaMA-Factory 的 `data/` 目录下。
2.  **必须要修改** `data/dataset_info.json` 文件，在其中追加以下注册信息，否则框架无法识别数据：

```json
  "my_custom_data": {
    "file_name": "mydataset.json"
  }
```

### 3\. 执行训练 (SFT)

将本仓库中的 `train_lora.sh` 脚本放入 LLaMA-Factory 根目录，执行以下命令开始微调：

```bash
bash train_lora.sh
```

### 4\. 启动推理对话

训练完成后，使用以下脚本加载微调后的 Adapter（适配器）进行效果测试：

```bash
bash test_chat.sh
```

-----

## 🛠️ 核心技术栈

  - **基础模型:** Qwen/Qwen2.5-7B-Instruct
  - **微调框架:** LLaMA-Factory (HuggingFace / ModelScope PEFT)
  - **参数策略:** LoRA (Low-Rank Adaptation)
  - **精度控制:** FP16 混合精度训练
  - **硬件环境:** 单卡 24GB VRAM (基于 AutoDL 云端算力)

## 💡 核心工程突破

1.  **显存优化与稳定性控制：**
    在单卡环境下，通过设置 `per_device_train_batch_size=2` 并配合梯度累积（Gradient Accumulation），有效平衡了内存吞吐量与梯度下降的稳定性，避免了 OOM（显存溢出）报错。

2.  **认知注入与过拟合策略：**
    针对极小样本数据集，动态调整学习率 $LR = 2 \times 10^{-4}$，并实施了 $40.0$ 个 Epoch 的深度过拟合训练。Loss 值从初始的 $3.35$ 最终收敛至 $0.45$，实现了模型身份认知的 $100\%$ 对齐。

3.  **网络链路优化：**
    引入 `USE_MODELSCOPE_HUB=1` 环境变量，解决了在特定网络环境下从 HuggingFace 拉取权重缓慢及超时的问题。

-----

## 📂 仓库结构说明

```text
├── .gitignore              # Git 忽略配置
├── LICENSE                 # MIT 开源协议
├── README.md               # 项目说明文档
├── mydataset.json          # 认知重塑多轮对话数据集
├── test_chat.sh            # 推理对话启动脚本
└── train_lora.sh           # SFT 训练启动脚本
```

## 🎯 效果展示

### 1\. 训练损失 (Loss) 收敛曲线

通过观察 Loss 曲线，模型在训练初期迅速捕捉到指令特征，并在 40 轮迭代内保持稳定下降。
<img width="1127" height="166" alt="loss_value" src="https://github.com/user-attachments/assets/674df42e-5b4d-42fa-9d22-977f27c54895" />


### 2\. 推理对话测试

微调后，模型成功识别开发者身份，并能根据预设语境进行准确回复。
<img width="953" height="480" alt="result0" src="https://github.com/user-attachments/assets/5fea4e23-2755-420c-afbe-b0b3a9fde5e8" />
<img width="1203" height="325" alt="train_result" src="https://github.com/user-attachments/assets/6c22f904-d036-4563-8d3c-f89d4af73614" />





## ⚖️ 开源协议

本项目采用 [MIT License](https://www.google.com/search?q=LICENSE) 协议。

```


