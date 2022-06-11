# Using Ultralytics/Yolov5 detect.py with Docker
## Using your own weights and images with Docker

<details open>
<summary>Install and Prepare</summary>
Clone repo on you local host
  
```bash
git clone https://github.com/Abzurde/yolov5.git
```

Prepare your data folder locally as show below
* Main folder
  - Image_Folder
  - Weights (your best.pt  for example)
  - Coco128.yaml

<details open>
<summary>Virtual Env</summary>
Now we are going to create and use a [**Python>=3.7.0**] environnement (use your cmd interface)
  
```
conda create --name your_env_name python=3.7
conda activate your_env_name
```
<details open>
<summary>Build Image</summary>
  
In you local environnement, reach your cloneed repo and use the following line (don't forget the . which corresponds to pwd): 
  ```bash
docker build -t yolov5:4.0 . 
```
