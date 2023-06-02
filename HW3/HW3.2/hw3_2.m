close all
clear
%% load img
img = imread('building.jpg'); %讀取圖片
img=rgb2gray(img); %將原圖轉為grayscale
imshow(img);title('original');figure; %展示原圖
%% kuwahara filters（X形）
img2 = img; %將img儲存到img2，以免再取變異數時取到更改後的值
[m,n]=size(img); %取得圖片大小
for i = 4:m-3 %row
    for j = 4:n-3 %column
        A(:,:,1) = [img(i-3,j-3),img(i-2,j-2),img(i-1,j-1),img(i,j)]; %kuwahara A區域
        A(:,:,2) = [img(i-3,j+3),img(i-2,j+2),img(i-1,j+1),img(i,j)]; %kuwahara B區域
        A(:,:,3) = [img(i-3,j+3),img(i-2,j+2),img(i-1,j+1),img(i,j)]; %kuwahara C區域
        A(:,:,4) = [img(i+3,j+3),img(i+2,j+2),img(i+1,j+1),img(i,j)]; %kuwahara D區域
        V = [var(double(A(:,:,1))),var(double(A(:,:,2))),var(double(A(:,:,3))),var(double(A(:,:,4)))]; %將VAR值存成陣列，方便調用
        [VAR_min,position] = min(V); %取得最低var值及在Ｖ陣列中的位置，方便等下取平均數
        img2(i,j) = mean(A(:,:,position)); %將最低var之平均值存進img
    end
end
imshow(img2);title('kuwahara');figure %展示經過kuwahara filters圖片
%% bilateral filters
img3 = imbilatfilt(img); %調用bilateral 函式
imshow(img3);title('bilateral'); %展示經過bilateral filters圖片