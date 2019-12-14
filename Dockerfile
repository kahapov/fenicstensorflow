FROM quay.io/fenicsproject/stable:current 

RUN apt install -y wget
# cudnn repo
RUN wget -O /tmp/cuda-repo.deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64/nvidia-machine-learning-repo-ubuntu1804_1.0.0-1_amd64.deb
RUN dpkg -i /tmp/cuda-repo.deb
# cuda repo
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb -O /tmp/cuda-repo.deb
RUN dpkg -i /tmp/cuda-repo.deb
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub

RUN apt update
RUN apt install -y libcudnn7=7.6.2.24-1+cuda10.0 \
	cuda-runtime-10-0 cuda-libraries-10-0

# use python3 by default
RUN update-alternatives --install /usr/local/bin/python python /usr/bin/python3 10
# install python dependencies 
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

