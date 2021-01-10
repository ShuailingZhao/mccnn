#!/usr/bin/python

import sys
import cv2
img = cv2.imread(sys.argv[1])
h = img.shape[0]
w = img.shape[1]
print h
#myreadimage(sys.argv[1]);
