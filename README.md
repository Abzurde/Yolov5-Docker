# Using Ultralytics/Yolov5 detect.py with Docker
## Using your own weights and images with Docker

<details open>
<summary>Install and Prepare</summary>
Clone repo on you local host
  
```bash
git clone https://github.com/Abzurde/yolov5.git
```

Prepare your data folder locally as shown below
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
  
In you local environnement, reach your cloneed repo and use the following line (don't forget the **'.'** which corresponds to pwd and you can change the **tag** as you want): 
```bash
docker build -t yolov5:tag . 
```
After 15-20 minutes you'll have your docker image
  
Go to your second folder, where you prepared you data, then use the following lines which will create a container with your image  (change the **tag** in **yolov5:yourtag**):
```bash
winpty docker run --mount type=bind,source="$(pwd)",target=/usr/src/app/data -it  yolov5:yourtag sh
```
and import your data inside of the conatiner with (you can erase the **--save-crop** if you don't want your image to be cropped):
```bash
python detect.py --weights /usr/src/app/data/your_weights_file --source /usr/src/app/data/your_image_folder --save-crop
```
<details open>
<summary>Copy your output in your local host</summary>
  
Open another cmd interface (because a container is totally isolated, so we can't use this line directly inside of it)
Before copying the output folder, let's get the our container id:
```bash
docker ps -a
```
When you have your container id, replace it in this following line:
```bash
docker cp your_container_id:/usr/src/app/runs/detect/exp .
```
  
Here you go you have your files !
