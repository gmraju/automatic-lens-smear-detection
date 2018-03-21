Note: 
-Matlab functions were used to perform edge detection, dilation, erosion, image complement and
 image matrix addition.

-We implemented Dilation and Erosion manually as well but run-times became very long (15 minutes)
 due to usage of loops and large size of images. Hence the in-built functions used instead.



Automatic Lens Smear Detection:

To obtain output-

-Place all files in the same folder (including .mat files)
-Run the RUN_THIS_MaskCreation.m script
-This will output the binary mask for camera 0 lens smear.

-To obtain outputs of other camera feeds:
	-Open the RUN_THIS_MaskCreation.m script
	-Change the .mat file being loaded to mask1.mat, mask2.mat, mask3.mat or mask5.mat
	-Run the script


ImageAggregation.m:

	-This script does not not need to be run (Has very long runtime)

	-This script has been run beforehand for each camera feed and the outputs
	 are included as mask0.mat, mask1.mat, mask2.mat, mask3.mat, mask5.mat

	-This script performs the edge detection and image aggregation steps.
	
	-Due to the large number of images, edge detection and aggregation took 
	 >2 hours for each camera feed.

	-If you wish to run this script, replace the 'insert path here' with path
	 of a camera feed folder. Also replace the .mat file specified in the 'save'method.