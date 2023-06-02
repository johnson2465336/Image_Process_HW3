close all
%% load image
img = imread('stair.jpg'); %讀取圖片
img = rgb2gray(img); %將原圖轉為grayscale
subplot(3,3,1);imshow(img);title('orignal'); %展示原圖
%% input filters
a = [-1 -1 0:-1 0 1:0 1 1];
b = [0 -1 -1:1 0 -1:1 1 0];
c = [-1 -1 -1:2 2 2:-1 -1 -1];
d = [-1 2 -1:-1 2 -1:-1 2 -1];
e = [-1 -1 -1:-1 8 -1:-1 -1 -1];
f = 1/9*[1 1 1:1 1 1:1 1 1];
g = [-1 0 1:-1 0 1:-1 - 1];
h = [0 -1 0:-1 4 -1:0 -1 0];
%% apply filters
img_a = conv2(img,a,'same');
img_b = conv2(img,b,'same');
img_c = conv2(img,c,'same');
img_d = conv2(img,d,'same');
img_e = conv2(img,e,'same');
img_f = conv2(img,f,'same');
img_g = conv2(img,g,'same');
img_h = conv2(img,h,'same');
%% show filtered image
subplot(3,3,2);imshow(img_a);title('a');
subplot(3,3,3);imshow(img_b);title('b');
subplot(3,3,4);imshow(img_c);title('c');
subplot(3,3,5);imshow(img_d);title('d');
subplot(3,3,6);imshow(img_e);title('e');
subplot(3,3,7);imshow(img_f);title('f');
subplot(3,3,8);imshow(img_g);title('g');
subplot(3,3,9);imshow(img_h);title('h');