
I = imread('C:\Users\Lucas\Documents\OctaveProjects\Lena.PNG');
I = double(I) / 255;
I = rgb2gray(I);

[l c] = size(I);


hx = zeros(l,c);
hy = zeros(l,c);

for x = 2:l-1
    for y = 2:c-1

        hx(x,y) =  -I(x-1,y-1) - 2*I(x,y-1) - I(x+1,y-1) + ...
                    I(x-1,y+1) + 2*I(x,y+1) + I(x+1,y+1);


        hy(x,y) = -I(x-1,y-1) - 2*I(x-1,y) - I(x-1,y+1) + ...
                   I(x+1,y-1) + 2*I(x+1,y) + I(x+1,y+1);

    endfor
endfor

H = sqrt(hx.^2 + hy.^2);

H = H / max(H(:));

figure;
imshow(I);
title('Imagem Original');

figure;
imshow(G);
title('Canny - Gradiente');
