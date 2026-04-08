🚀 基于 LLaMA-Factory 的 Qwen2.5-7B 指令微调与认知对齐实战
📝 项目简介
本项目基于 LLaMA-Factory 框架，对开源大语言模型 Qwen2.5-7B-Instruct 进行了 LoRA 指令微调。项目核心目标是实现模型的“身份认知对齐（Identity Alignment）”，使其在特定语境下产生预设的人格化回复，并成功克服了在有限显存环境下的训练瓶颈。
🚀 快速开始 (Quick Start)
1. 环境准备
确保您的机器已安装 Python 3.8+、CUDA 环境及相关的显卡驱动，执行以下命令安装核心框架：
git clone https://github.com/hiyouga/LLaMA-Factory.git
cd LLaMA-Factory
pip install -e ".[metrics,bitsandbytes]"
2. 数据集配置 (关键步骤
将本仓库中的 mydataset.json 拷贝至 LLaMA-Factory 的 data/ 目录下。
必须要修改 data/dataset_info.json 文件，在其中追加以下注册信息，否则框架无法识别数据：
"my_custom_data": {
    "file_name": "mydataset.json"

  }
3. 执行训练 (SFT)
将本仓库中的 train_lora.sh 脚本放入 LLaMA-Factory 根目录，执行以下命令开始微调：
bash train_lora.sh
4. 启动推理对话
训练完成后，使用以下脚本加载微调后的 Adapter（适配器）进行效果测试：
bash test_chat.sh
