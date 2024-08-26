build a base images

docker build -t cuda:11.8.0-devel-ubuntu20.04-py311 -f Dockerfile .
docker build -t cuda:11.8.0-devel-ubuntu20.04-py39 -f Dockerfile .

## install packages
### install torch first
pip3 wheel -w wheel_packages/ torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

pip install torch torchvision torchaudio --no-index -f wheel_packages

### install others
