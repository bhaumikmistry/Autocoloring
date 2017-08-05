# coloring of aztec and patterns

import cv2
import random as rm
import numpy as np

# Read image
im_input = cv2.imread('harsha_mandala.png')

# converting it to gray if image is color
im_gray = cv2.cvtColor(im_input,cv2.COLOR_BGR2GRAY)

# Display image
# cv2.imshow('gray',im_gray)


# converting it to binart image
(thresh,im_bw) = cv2.threshold(im_gray,127,255,cv2.THRESH_BINARY|cv2.THRESH_OTSU)

# Display image
# cv2.imshow('bw',im_bw)


# Find countours
contours, hierarchy = cv2.findContours(im_bw,cv2.RETR_TREE,cv2.CHAIN_APPROX_SIMPLE)

# Details about countours
# print (len(contours))
# cnt = contours[0]
# print (cnt)

# color array for lines color map from image
lines = np.array([[194,114,1],[26,88,210],[33,175,240],[142,48,123],[48,172,122],[247,189,77],[49,19,169]])

# if you want same color in all contours
# cv2.drawContours(im_input,contours,-1,(255,255,0),-1)

# changing values of color pixels using randint def of lib rand
# for i in range(len(contours)):
# 	cv2.drawContours(im_input,contours,i,(rm.randint(1, 255),
# 		rm.randint(1, 50),
# 		rm.randint(1, 255)),-1)

# filling color lines in the countours
color = lines
colorCount = 7
ind = 0

areas = [cv2.contourArea(c) for c in contours]
max_index = np.argmax(areas)
print max_index
cv2.drawContours(im_input,contours,max_index,(255,255,255),-1)

for i in range(len(contours)):
	if(i!=max_index):
		cv2.drawContours(im_input,contours,i,
			(color[ind,0],color[ind,1],color[ind,2]),
			-1)
		if ind >= colorCount-1:
			ind = 0
		else:
			ind = ind + 1

# count1 = 255
# count2 = 0

# cv2.drawContours(im_input,contours,-1,(255,255,0),-1),
    		
h , w = im_bw.shape

for i in range(1,h-1):
	for j in range(1,w-1):

		if im_bw[i,j] == 0:
			im_input[i,j,:]=0

cv2.imwrite('coloredImage.png',im_input)


while(1):
    cv2.imshow('image',im_input)

    if cv2.waitKey(20) & 0xFF == 27:
        break
cv2.destroyAllWindows()
