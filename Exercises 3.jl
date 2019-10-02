using PyPlot; pygui(true);
using JLD; using Statistics;

img = imread("el-capitan.png")
imshow(img) # Answer to question 1Aa.

"""
extract(image_file)

- Takes String image_file, displays the image, then extracts and
  returns the R, G, and B channels.

PARAMETERS:

- name of image file (String)

RETURNS:

- R channel
- G channel
- B channel
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

red1, green1, blue1 = extract("el-capitan.png")
# Extracts and stores red, green, and blue channels of image 1.

image2 = zeros(360, 640, 3)
image2[:,:,1] = green1[:,:]
image2[:,:,2] = blue1[:,:]
image2[:,:,3] = red1[:,:]

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
- (optional) channel to modify (Int), defaults to 1

RETURNS:

- shifted channel (Matrix)
"""
function shift_img(image_file, pixel_shift; channel=1)
    old = imread(image_file)
    target_rows = old[1:pixel_shift,:,channel]
    new = vcat(old[pixel_shift+1:end,:,channel], target_rows)
    return new
end

original = img[:,:,1]
shifted = shift_img("el-capitan.png",180)

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
