#Deriving the latest base image
FROM python:latest

# Any working directory can be chosen as per choice like '/' or '/home' etc
# i have chosen /usr/src/app
WORKDIR /usr/src/app

#to COPY the remote file at working directory in container

ADD yolov5 /usr/src/app
# Now the structure looks like this '/usr/app/src/detect.py'

# Install pip packages
RUN pip freeze > requirements.txt
RUN pip install --upgrade pip
RUN pip install torch
RUN pip install numpy
RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6 -y 
RUN pip3 install opencv-python
RUN pip install pandas
RUN pip3 install requests
RUN pip install pyyaml
RUN pip install Pillow
RUN pip3 install tqdm
RUN pip3 install torchvision -f cpu/torchvision-0.8.1%2Bcpu-cp38-cp38-linux_x86_64.whl
RUN pip install matplotlib
RUN pip install seaborn

#CMD instruction should be used to run the software
#contained by your image, along with any arguments.

CMD ["bash"]