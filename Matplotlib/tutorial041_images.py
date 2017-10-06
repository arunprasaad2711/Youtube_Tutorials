# Matplotlib Tutorials
# reading and displaying images

# Use Pillow, OpenCV, etc., library for better image processing

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as img

image_name='Lena.png'
# image_name='lamp.jpg'
# image_name='landscape_pic.jpg'

im_data = img.imread(image_name)
print(im_data)
print(np.shape(im_data))

# Data in MxN (rarely), MxNx3 (standard RGB), MxNx4 (RGBA)
red_data = im_data[:,:,0]
green_data = im_data[:,:,1]
blue_data = im_data[:,:,2]

# new image - swap RGB order
image1 = np.array([blue_data, green_data, red_data])
image1 = np.swapaxes(image1, 0, 1)
image1 = np.swapaxes(image1, 1, 2)
print(np.shape(image1))

# new image - colour tweaked
image2 = np.array([1.0*green_data, 0.5*red_data, 0.5*blue_data]) # If RGB values are float
# image2 = np.array([(1.5*green_data)%256, (1.0*red_data)%256, (1.0*blue_data)%256]).astype(np.uint8) # if RGB values are int
image2 = np.swapaxes(image2, 0, 1)
image2 = np.swapaxes(image2, 1, 2)
print(np.shape(image2))
#
# cmap = 'gray'
cmap = 'jet'
#
plt.figure(figsize=(15,10))
#
plt.subplot(231)
plt.imshow(im_data, cmap=cmap, interpolation='nearest')
plt.axis('off')
plt.title('Original Image in RGB')

plt.subplot(232)
plt.imshow(image1, cmap=cmap, interpolation='nearest')
plt.axis('off')
plt.title('Image in BGR')

plt.subplot(233)
plt.imshow(image2, cmap=cmap, interpolation='nearest')
plt.axis('off')
plt.title('Image tweaked')

plt.subplot(234)
plt.imshow(red_data, cmap=cmap, interpolation='nearest')
plt.axis('off')
plt.title('Red Channel')
plt.colorbar()

plt.subplot(235)
plt.imshow(green_data, cmap=cmap, interpolation='nearest')
plt.axis('off')
plt.title('Green Channel')
plt.colorbar()

plt.subplot(236)
plt.imshow(blue_data, cmap=cmap, interpolation='nearest')
plt.axis('off')
plt.title('Blue Channel')
plt.colorbar()
#
plt.figure(figsize=(15,10))
plt.subplot(131)
plt.hist(red_data.ravel(), bins=100, fc='red', ec='k')
plt.subplot(132)
plt.hist(green_data.ravel(), bins=100, fc='green', ec='k')
plt.subplot(133)
plt.hist(blue_data.ravel(), bins=100, fc='blue', ec='k')
plt.show()