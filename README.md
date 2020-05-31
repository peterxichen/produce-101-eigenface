# produce-101-eigenface

Read the detailed study here:
https://peterxichen.github.io/produce-101-eigenface/main.nb.html

This project makes extensive use of https://github.com/johnwmillr/Facer
based on OpenCV.

Face landmark detection uses a pre-trained dlib model availible at http://dlib.net/files/shape_predictor_68_face_landmarks.dat.bz2

The subject of this study will be the third season of the South Korean reality franchise Produce 101 (entitled Produce 48). Dataset of Produce 48 contestants are obtained from https://48pedia.org.

Main orchestration can be executed in main.rmd using R. To execute script to produce average face, run the following command:
```
python3 avg_face.py
```