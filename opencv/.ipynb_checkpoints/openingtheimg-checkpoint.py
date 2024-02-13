import cv2

img=cv2.imread('C:/Users/acer/Documents/imageprocess/opencv/peakpx.jpg')

while True:
    cv2.imshow('bat',img)
    if cv2.waitKey(1) & 0xFF==ord("a"):
        break
        

cv2.destroyAllWindows()