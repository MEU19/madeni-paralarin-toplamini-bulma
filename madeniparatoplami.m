clc;
clear;

imggri = imread("paralar.png");
imshow(imggri);

imgsb = imbinarize(imggri);
imshow(imgsb);

imgsb = imfill(imgsb,"holes");
imshow(imgsb);
imshow(imggri);
sinirlar = bwboundaries(imgsb);
figure,imshow(imgsb);

nesnesayisi = length(sinirlar);
text(5,5,['bulunan nesne sayisi: ',num2str(nesnesayisi)],'Color','r');

hold on;
for k=1:nesnesayisi
    sinir = sinirlar{k};
    plot(sinir(:,2),sinir(:,1),'c','LineWidth',3);
end
[etiketlinesneler,nesnesayisi] = bwlabel(imgsb);
nesneozellikleri = regionprops(etiketlinesneler,"Area","Centroid");
toplam = 0;
alanesikdeger = 2000;
for k=1:nesnesayisi
    merkez = nesneozellikleri(k).Centroid;
    x = merkez(1);y = merkez(2);
    alandegeri = nesneozellikleri(k).Area;
    

   if alandegeri > alanesikdeger
       text(x-10,y,'10K','FontSize',15,'FontWeight','bold');
       toplam = toplam+10;
   else
       toplam = toplam+5;
       text(x-10,y,'5K','FontSize',15,'FontWeight','bold');
   end
end

hold off;






