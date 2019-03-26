%Convolution avec FFT

f = imread('cameraman.tif');
F = fft2(f);
H = zeros(256);
for i = 1:256
    for j = 1:256
       p = sqrt((i-128)*(i-128) + (j-128)*(j-128));
       if p < 30   %freq de coupure (rayon du cercle)
           H(i,j) = 1/30;
       end
    end
end
figure(5)
imagesc(H)
colormap(gray)

Fshift = fftshift(F);
G = Fshift .* H;
Gshift = fftshift(G);
g = ifft2(Gshift);
greel = real(g);

min(min(greel))

gpos = (greel > 0).*greel;

figure(6)
imagesc(gpos)
colormap(gray)

figure(7)
imagesc(log(1 + abs(Fshift)))
colormap(gray)



figure(8)
imagesc(log(1 + abs(G)))
colormap(gray)
