####

using PyPlot; pygui(true);
using JLD; using Statistics;

img = imread("el-capitan.png")
imshow(img) # Answer to question 1Aa.

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

figure(2)
subplot(1,2,1)
imshow(img)
axis("off")
title("Image 1")
subplot(1,2,2)
imshow(image2)
axis("off")
title("Image 2")
# Shows side-by-side comparison of images. Answer to 1Ae.

####

using PyPlot; pygui(true);
using JLD; using Statistics;

####
