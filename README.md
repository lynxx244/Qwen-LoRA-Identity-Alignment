# 🚀 基于 LLaMA-Factory 的 Qwen2.5-7B 指令微调与认知对齐实战

## 📝 项目简介
本项目基于 **LLaMA-Factory** 框架，对开源大语言模型 **Qwen2.5-7B-Instruct** 进行了 LoRA 指令微调。项目核心目标是实现模型的“身份认知对齐（Identity Alignment）”，使其在特定语境下产生预设的人格化回复，并成功克服了在有限显存环境下的训练瓶颈。

---

## 🚀 快速开始 (Quick Start)

### 1. 环境准备
确保您的机器已安装 Python 3.8+、CUDA 环境及相关的显卡驱动，执行以下命令安装核心框架：

```bash
git clone [https://github.com/hiyouga/LLaMA-Factory.git](https://github.com/hiyouga/LLaMA-Factory.git)
cd LLaMA-Factory
pip install -e ".[metrics,bitsandbytes]"
