# 🚀 基于 LLaMA-Factory 的 Qwen2.5-7B 指令微调与认知对齐实战

## 📝 项目简介
本项目通过 LoRA 微调技术，实现了对 Qwen2.5-7B 模型的人格重塑与垂直领域知识注入。通过调整优化器步长与学习率，成功将训练 Loss 从 3.35 降低至 0.45。

---

## 🚀 快速开始 (Quick Start)

### 1. 环境准备
确保您的机器已安装 Python 3.8+ 和 CUDA 环境，执行以下命令安装 LLaMA-Factory：

```bash
git clone [https://github.com/hiyouga/LLaMA-Factory.git](https://github.com/hiyouga/LLaMA-Factory.git)
cd LLaMA-Factory
pip install -e ".[metrics,bitsandbytes]"
