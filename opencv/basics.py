import cv2

image_name = "retina.jpeg"

image = cv2.imread(image_name ,cv2.IMREAD_COLOR)

cv2.imshow(image_name ,image)

cv2.imwrite("grey_retina.jpg",image)

# wait for a key press
cv2.waitKey(0)

cv2.destroyAllWindows()

