# Finger-detection-and-counting

Problem Description:

Our Problem is counting number of fingers from image. Some images of hand will be given as input. We have to find how many fingers are up in the image.  

Input Description:

1.	Number of image: There are total 5 images of hand. Different number of fingers are up in different image. 
2.	Dimensions: The dimension of each images are 742x 680 pixels. 
3.	Format: png (Transparent Background).

Methodology:

The process of counting number of fingers from image is given below.
Step-1: Read Input Image.
Step-2: Convert the image of step 1 to Binary Image.
Step-3: Preprocessing (Small Object Removal, Filling Holes) the image of step 2.
Step-4: Eroding the image of step-3.
Step-5: Dilating the image of step-4.
Step-6: Subtracting the image of step-5 from the image of step-2.
Step-7: Removing noise from the image of step-6.
Step-8: Counting Number of object (fingers) by using bwlabel function.
