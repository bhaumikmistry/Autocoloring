clear all;
close all;

%% read image
A = imread('patternDoodle.jpg');

% Distplay image
figure, imshow(A);
title('Original Image');



%% Make it black and white

% Get the threshold values
threshold = graythresh(A);
% converting it into  binary image.
BW =im2bw(A,threshold);

% Display materials
%B= im2bw(A);
% figure,imshow(BW);
% title('Black and white image');

%% Filling the holes to get a clear white mask to count

% Use only if you want to fill the holes in shapes.
% BW = imfill(BW,'holes');
% figure,imshow(BW);


%%
figure,imshow('colormap.png');

% The above mentioned image is a screenshot in colormap tutorial.
% please read the help section matlab/colormap
% there are predefined color maps and you can have your own too.

% Take user input for changing the color fill accotding to choice.
prompt = 'choose a color map drom displayed image';
xx = input(prompt,'s');

if strcmp('parula',xx)==1
    fh = @parula;
elseif strcmp('jet',xx)==1 
    fh = @jet;
elseif strcmp('hsv',xx)==1 
    fh = @hsv;
elseif strcmp('hot',xx)==1 
    fh = @hot;
elseif strcmp('cool',xx)==1 
    fh = @cool;
elseif strcmp('spring',xx)==1 
    fh = @spring;
elseif strcmp('autum',xx)==1 
    fh = @autum;
elseif strcmp('winter',xx)==1 
    fh = @winter;
elseif strcmp('gray',xx)==1 
    fh = @gray;
elseif strcmp('bone',xx)==1 
    fh = @bone;
elseif strcmp('copper',xx)==1 
    fh = @copper;
elseif strcmp('pink',xx)==1 
    fh = @pink;
elseif strcmp('lines',xx)==1 
    fh = @lines;
elseif strcmp('colorcube',xx)==1 
    fh = @colorcube;
elseif strcmp('prism',xx)==1 
    fh = @prism;
elseif strcmp('flag',xx)==1    
    fh = @flag;
else
    fh = @white;
end
   
% traces the exterior boundary of objects, as well
% as boundaries of holes inside these objects.

% 'holes' and unholes' can be seen with different imgaes,
% holes will give you more shapes and shapes within shapes
% where unholes will ignore shapes within shapes.
[B,L] = bwboundaries(BW,'holes');
draw = label2rgb(L,fh, 'w','shuffle');



%% Putting the boundries back.

% size of the 2-D image.
[x,y] =  size(BW);

% nested forloop to restore the black boundries of the images
% to give the final image a better look.

for i = 1:x
    for j= 1:y
        
        if (BW(i,j) == 0)
           
            draw(i,j,:) = 0;
            
        end
            
        
    end
end

% display 
figure;
imshow(draw);title('With bordr');

% write the image as the given name at the current path.
imwrite(draw,'colored_image3.jpg');

