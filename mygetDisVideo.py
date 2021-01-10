#!/usr/bin/python
import os
import cv2

videoCapture = cv2.VideoCapture('./samples/input/test003.avi')  
  
fps = videoCapture.get(cv2.CAP_PROP_FPS)  
size = (int(videoCapture.get(cv2.CAP_PROP_FRAME_WIDTH)),   
        int(videoCapture.get(cv2.CAP_PROP_FRAME_HEIGHT)))  
  
videoWriter = cv2.VideoWriter('./samples/output/mytestDisp.avi', cv2.VideoWriter_fourcc(*'XVID'), fps, size)  

success, frame = videoCapture.read()  
ind = 0
while success :  
    #cv2.imshow("Oto Video", frame)   
    #cv2.waitKey(1000/int(fps)) 
    h,w = frame.shape[:2]
    limgData = frame[:,0:w/2,:]
    rimgData = frame[:,w/2:w,:]
    cv2.imwrite('./samples/output/L.png',limgData)
    cv2.imwrite('./samples/output/R.png',rimgData)
      
    os.system("./main.lua kitti fast -a predict -net_fname net/net_kitti_fast_-a_train_all.t7 -left samples/output/L.png -right samples/output/R.png -disp_max 70")
    print("9999999999999999 %d %d" %(h,w))
    os.system("./samples/bin2png.lua 70 %d %d" % (h,w/2))
    disp = cv2.imread('disp.png');
    dispShow =cv2.resize(disp,(320,180),interpolation=cv2.INTER_CUBIC)
    cv2.imshow("disp",dispShow)
    cv2.waitKey(1000/int(fps)) 
    indstr = '%08d' % ind
    dispIndName = 'D' + indstr + '.png'
    os.system("mv disp.png %s" % dispIndName)
    os.system("mv %s samples/output" % dispIndName)
    videoWriter.write(disp)  
    print("---------------------------------- %s" % dispIndName)
    success, frame = videoCapture.read()
    ind = ind + 1
videoCapture.release()
videoWriter.release()
