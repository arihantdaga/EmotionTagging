FROM python:3.6-stretch
MAINTAINER Tina Bu <tina.hongbu@gmail.com>

# install build utilities
RUN apt-get update && \
	apt-get install -y gcc make apt-transport-https ca-certificates build-essential git

# RUN git clone https://github.com/torch/distro.git /root/torch --recursive && \
# 	cd /root/torch && \
# 	bash install-deps && \
# 	yes no | ./install.sh

# check our python environment
RUN python3 --version
RUN pip3 --version

RUN pip3 install torch==1.7.1+cpu torchvision==0.8.2+cpu torchaudio==0.7.2 -f https://download.pytorch.org/whl/torch_stable.html


# set the working directory for containers
WORKDIR  /usr/src/moodtagging

# Installing python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

ENV FLASK_APP server.py
ENV FLASK_RUN_HOST=0.0.0.0
WORKDIR /code

# Copy all the files from the project’s root to the working directory
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

EXPOSE 5005
COPY . .
RUN ls -la
ENTRYPOINT ["python3"]



# Running Python Application
CMD ["src/server.py"]
