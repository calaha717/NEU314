using PyPlot; pygui(true);
using JLD;

#= Use  imread() to load it into Julia and imshow() to display it
 in a figure. =#
img = imread("el-capitan.png")
imshow(img) # Answer to question 1Aa.

#= Write a function that takes as input a string representing the
   filename, and then loads the image file, displays it, and
   extracts the red, blue, and green channels into separate
   variables, and returns the content of those variables. =#

"""
extract(image_file)

- Takes String image_file, displays the image, then extracts and
  returns the R, G, and B channels.

PARAMETERS:

- name of image file (String)

RETURNS:

- R channel (Matrix)
- G channel (Matrix)
- B channel (Matrix)
"""
function extract(image_file) # Answer to question 1Ab.
    img = imread(image_file)
    imshow(img)
    red = img[:,:,1] # Gets red channel.
    green = img[:,:,2] # Gets green channel.
    blue = img[:,:,3] # Gets blue channel.
    return red, green, blue
end

println("Reset with git reset --mixed")

#= Make a new 360x640x3 matrix; let’s call this image2. Set
   image2[:,:,1] to be the G channel from the original image,
   image2[:,:,2] to be the B channel from the original image,
   and image2[:,:,3] to be the R channel from the original
   image. =#

red1, green1, blue1 = extract("el-capitan.png")
# Extracts and stores red, green, and blue channels of image 1.

image2 = zeros(360, 640, 3) # Creates new "image"
image2[:,:,1] = green1[:,:]
# Fills red channel with extracted green channel.
image2[:,:,2] = blue1[:,:]
# Fills green channel with extracted blue channel.
image2[:,:,3] = red1[:,:]
# Fills blue channel with extracted red channel.

figure(2) # Makes new figure.
subplot(1,2,1)
imshow(img)
axis("off")
title("Image 1")
subplot(1,2,2)
imshow(image2)
axis("off")
title("Image 2")
# Shows side-by-side comparison of images. Answer to 1Ae.

using PyPlot; pygui(true);
using JLD; using Statistics;

#= Write a function that, for given an image, circularly moves
   only one channel, the red channel (remember, this is the
   first one) up some number of pixels, p, such that the top
   p rows now become the bottom p rows. =#

"""
shift_img(image_file, pixel_shift; channel=1)

- Takes String image_file, Int pixel_shift, and optional Int
  channel, then shifts the channel by pixel_shift pixels. In
  order to do this, the function takes the top pixel_shift rows
  and moves them to the bottom of the channel. If no channel
  specification is given, defaults to channel 1 (red). Returns
  shifted channel.

PARAMETERS:

- name of image file (String)
- number of pixel rows to shift (Int)
- (optional) channel to be modified (Int), defaults to 1 (red)

RETURNS:

- shifted channel (Matrix)
"""
function shift_img(image_file, pixel_shift; channel=1)
    old = imread(image_file) # Reads original image.
    target_rows = old[1:pixel_shift,:,channel]
    new = vcat(old[pixel_shift+1:end,:,channel], target_rows)
    return new # Returns shifted channel.
end

original = img[:,:,1]
shifted = shift_img("el-capitan.png",180)
# Shifts image's red channel by 180 pixels.

#= Display both the original image channel and the result of
   circularly moving the red channel up by 180 pixels. =#

figure(3) # Makes new figure.
subplot(1,2,1)
imshow(original)
axis("off")
title("Original Channel")
subplot(1,2,2)
imshow(shifted)
axis("off")
title("Shifted Channel")
# Shows side-by-side comparison of image channels. Answer to 1B.
