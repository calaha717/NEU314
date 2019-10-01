using PyPlot; pygui(true);
using JLD; using Statistics;

img = imread("el-capitan.png")
imshow(img) # Answer to question 1a.

function extract(image_file) # Answer to question 1b.
    img = imread(image_file)
    imshow(img)
    red = img[:,:,1] # Gets red channel.
    green = img[:,:,2] # Gets green channel.
    blue = img[:,:,3] # Gets blue channel.
    return red, green, blue
end
