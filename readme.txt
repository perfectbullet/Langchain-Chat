#########################

root@97afe7574185:/langchain-chatchat# CUDA_VISIBLE_DEVICES=0 python3 -c "import torch;torch.cuda.is_available()"
/usr/local/lib/python3.10/dist-packages/torch/cuda/__init__.py:107: UserWarning: CUDA initialization: Unexpected error from cudaGetDeviceCount(). Did you run some cuda functions before calling NumCudaDevices() that might have already set an error? Error 804: forward compatibility was attempted on non supported HW (Triggered internally at ../c10/cuda/CUDAFunctions.cpp:109.)
  return torch._C._cuda_getDeviceCount() > 0
root@97afe7574185:/langchain-chatchat# nvcc -V
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2023 NVIDIA Corporation
Built on Mon_Apr__3_17:16:06_PDT_2023
Cuda compilation tools, release 12.1, V12.1.105
Build cuda_12.1.r12.1/compiler.32688072_0
root@97afe7574185:/langchain-chatchat#



#########################



### 1. 

docker pull pytorch/conda-builder:cuda121

### 2 ###

docker compose up


### 3. #### in jupyter started by docker

pip wheel -w wheel_packages -r requirements.txt
pip install -r requirements.txt --no-index -f wheel_packages

### 4. 模型下载
$ git lfs install
$ git clone https://huggingface.co/THUDM/chatglm2-6b
$ git clone https://huggingface.co/moka-ai/m3e-base

或者

### 5. 第一次运行本项目
1. download model from https://huggingface.co/BAAI/bge-large-zh-v1.5/tree/main
2. and then move it to project root dir
3. edit config/model_config.py, change this line into right path
    # 选用的 Embedding 名称
    EMBEDDING_MODEL = "bge-large-zh-v1.5"

root@c10dbccd4085:~/app# python3 init_database.py --recreate-vs


### 6. run a demo
一键启动脚本 startup.py， 一键启动所有 Fastchat 服务、API 服务、WebUI 服务，示例代码：

root@c10dbccd4085:~/app# python3 startup.py -a




