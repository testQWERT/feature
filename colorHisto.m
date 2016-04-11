function [ feat ] = colorHisto( img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

img2=double(img);
feat=[];
[h,w,~]=size(img2);
R=zeros(32,1);G=zeros(32,1);B=zeros(32,1);
for i=1:h
    for j=1:w
        if img2(i,j,1)>=255
            img2(i,j,1)=255;
        end
        if img2(i,j,2)>=255
            img2(i,j,2)=255;
        end
        if img2(i,j,3)>=255
            img2(i,j,3)=255;
        end
        
        if img2(i,j,1)<=0
            img2(i,j,1)=1;
        end
        if img2(i,j,2)<=0
            img2(i,j,2)=1;
        end
        if img2(i,j,3)<=0
            img2(i,j,3)=1;
        end
        R(ceil((img2(i,j,1)+1)/8))=R(ceil((img2(i,j,1)+1)/8))+1;
        G(ceil((img2(i,j,2)+1)/8))=G(ceil((img2(i,j,2)+1)/8))+1;
        B(ceil((img2(i,j,3)+1)/8))=B(ceil((img2(i,j,3)+1)/8))+1;
    end
end
R=R./repmat(sqrt(sum(R.^2,1)),size(R,1),1);
G=G./repmat(sqrt(sum(G.^2,1)),size(G,1),1);
B=B./repmat(sqrt(sum(B.^2,1)),size(B,1),1);
feat=[feat;R;G;B];

img2 = imresize(img, 0.75);
img2=double(img2);
img2=floor(img2);
[h,w,~]=size(img2);
R=zeros(32,1);G=zeros(32,1);B=zeros(32,1);
for i=1:h
    for j=1:w
        if img2(i,j,1)>=255
            img2(i,j,1)=255;
        end
        if img2(i,j,2)>=255
            img2(i,j,2)=255;
        end
        if img2(i,j,3)>=255
            img2(i,j,3)=255;
        end
        
        if img2(i,j,1)<=0
            img2(i,j,1)=1;
        end
        if img2(i,j,2)<=0
            img2(i,j,2)=1;
        end
        if img2(i,j,3)<=0
            img2(i,j,3)=1;
        end
        R(ceil((img2(i,j,1)+1)/8))=R(ceil((img2(i,j,1)+1)/8))+1;
        G(ceil((img2(i,j,2)+1)/8))=G(ceil((img2(i,j,2)+1)/8))+1;
        B(ceil((img2(i,j,3)+1)/8))=B(ceil((img2(i,j,3)+1)/8))+1;
    end
end
R=R./repmat(sqrt(sum(R.^2,1)),size(R,1),1);
G=G./repmat(sqrt(sum(G.^2,1)),size(G,1),1);
B=B./repmat(sqrt(sum(B.^2,1)),size(B,1),1);
feat=[feat;R;G;B];

img2 = imresize(img, 0.5);
img2=double(img2);
img2=floor(img2);
[h,w,~]=size(img2);
R=zeros(32,1);G=zeros(32,1);B=zeros(32,1);
for i=1:h
    for j=1:w
        if img2(i,j,1)>=255
            img2(i,j,1)=255;
        end
        if img2(i,j,2)>=255
            img2(i,j,2)=255;
        end
        if img2(i,j,3)>=255
            img2(i,j,3)=255;
        end
        
        if img2(i,j,1)<=0
            img2(i,j,1)=1;
        end
        if img2(i,j,2)<=0
            img2(i,j,2)=1;
        end
        if img2(i,j,3)<=0
            img2(i,j,3)=1;
        end
        R(ceil((img2(i,j,1)+1)/8))=R(ceil((img2(i,j,1)+1)/8))+1;
        G(ceil((img2(i,j,2)+1)/8))=G(ceil((img2(i,j,2)+1)/8))+1;
        B(ceil((img2(i,j,3)+1)/8))=B(ceil((img2(i,j,3)+1)/8))+1;
    end
end
R=R./repmat(sqrt(sum(R.^2,1)),size(R,1),1);
G=G./repmat(sqrt(sum(G.^2,1)),size(G,1),1);
B=B./repmat(sqrt(sum(B.^2,1)),size(B,1),1);
feat=[feat;R;G;B];
end

