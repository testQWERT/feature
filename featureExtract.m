function [ imA,imB ] = featureExtract( im1name,im2name,peopleNumA,peopleNumB,peopleNumA2,peopleNumB2,root,filesPersonA,filesPersonB,orientalPatchNum)
%��ȡ����ͼ��hog+rgb���������˱�����û��
%   Detailed explanation goes here
% imA����pic,no,person,feature,edgefeature,wN,wE��person����patchNum,data{n,2}��num��patch{n,pN,2},patchfeature{n,pN},feature{n}
%
verticalPatchNum=floor(orientalPatchNum*128/48);
pN=orientalPatchNum*verticalPatchNum;
addpath('./edge');
imA.pic=imread([root,im1name]);
imB.pic=imread([root,im2name]);
imA.no=(im1name(1)-'0')*100+(im1name(2)-'0')*10+(im1name(3)-'0')-5;
imB.no=(im2name(1)-'0')*100+(im2name(2)-'0')*10+(im2name(3)-'0')-5;
imA.person.num=peopleNumA(imA.no);imB.person.num=peopleNumB(imB.no);
imA.person.data=cell(imA.person.num,2);imA.person.patch=cell(imA.person.num,pN,2);imA.person.patchfeature=cell(imA.person.num,pN);
imB.person.data=cell(imB.person.num,2);imB.person.patch=cell(imB.person.num,pN,2);imB.person.patchfeature=cell(imB.person.num,pN);
imA.person.patchNum=pN;
imB.person.patchNum=pN;
%imA.person.feature=cell(1,imA.person.num);imA.person.feature=cell(1,imB.person.num);
%imA.person.feature{1,:}=[];imB.person.feature{1,:}=[];

for i=1:imA.person.num
    tmp=filesPersonA(peopleNumA2(imA.no)+i).name;
    %imA.person.data��n*2��Ԫ�����飬�����е�ÿ��Ԫ�ض���һ���������꣬����(n,1)�ǵ�n���˵����Ͻ�λ�ã�(n,2)�ǵ�n���˵Ŀ�ͳ�
    imA.person.data{i,1}=[str2double(tmp(9:11)),str2double( tmp(13:15))];
    if imA.person.data{i,1}(1)==0
        imA.person.data{i,1}(1)=1;
    end
    if imA.person.data{i,1}(2)==0
        imA.person.data{i,1}(2)=1;
    end
    imA.person.data{i,2}=[str2double(tmp(19:21)),str2double( tmp(23:25))];
    imA.person.data{i,2}=imA.person.data{i,2}-imA.person.data{i,1};
    tmp=imA.person.data{i,2};
    tmp2=imA.person.data{i,1};%tmp���˵Ŀ�ͳ���tmp2���˵ĺ�����������ꡣ
    for k=1:verticalPatchNum
        for b=1:orientalPatchNum
            imA.person.patch{i,(k-1)*orientalPatchNum+b,2}=[floor(tmp(1)/orientalPatchNum),floor(tmp(2)/verticalPatchNum)];
            imA.person.patch{i,(k-1)*orientalPatchNum+b,1}=[tmp2(1)+(b-1)*floor(tmp(1)/orientalPatchNum),tmp2(2)+(k-1)*floor(tmp(2)/verticalPatchNum)];
        end
%         imshow(imA.pic(imA.person.patch{i,(k-1)*orientalPatchNum+b,1}(2):(imA.person.patch{i,(k-1)*orientalPatchNum+b,1}(2)+imA.person.patch{i,(k-1)*orientalPatchNum+b,2}(2)),...
%             imA.person.patch{i,(k-1)*orientalPatchNum+b,1}(1):(imA.person.patch{i,(k-1)*orientalPatchNum+b,1}(1)+imA.person.patch{i,(k-1)*orientalPatchNum+b,2}(1)),:));
%         pause;
    end
end
for i=1:imB.person.num
    tmp=filesPersonB(peopleNumB2(imB.no)+i).name;
    %imB.person.data��n*2��Ԫ�����飬�����е�ÿ��Ԫ�ض���һ���������꣬����(n,1)�ǵ�n���˵����Ͻ�λ�ã�(n,2)�ǵ�n���˵Ŀ�ͳ�
    imB.person.data{i,1}=[str2double(tmp(9:11)),str2double( tmp(13:15))];
    if imB.person.data{i,1}(1)==0
        imB.person.data{i,1}(1)=1;
    end
    if imB.person.data{i,1}(2)==0
        imB.person.data{i,1}(2)=1;
    end
    imB.person.data{i,2}=[str2double(tmp(19:21)),str2double( tmp(23:25))];
    imB.person.data{i,2}=imB.person.data{i,2}-imB.person.data{i,1};
    tmp=imB.person.data{i,2};
    tmp2=imB.person.data{i,1};
    %imshow(imB.pic);
    for k=1:verticalPatchNum
        for b=1:orientalPatchNum
            imB.person.patch{i,(k-1)*orientalPatchNum+b,2}=[floor(tmp(1)/orientalPatchNum),floor(tmp(2)/verticalPatchNum)];
            imB.person.patch{i,(k-1)*orientalPatchNum+b,1}=[tmp2(1)+(b-1)*floor(tmp(1)/orientalPatchNum),tmp2(2)+(k-1)*floor(tmp(2)/verticalPatchNum)];
        end
%         imshow(imA.pic(imA.person.patch{i,(k-1)*orientalPatchNum+b,1}(2):(imA.person.patch{i,(k-1)*orientalPatchNum+b,1}(2)+imA.person.patch{i,(k-1)*orientalPatchNum+b,2}(2)),...
%             imA.person.patch{i,(k-1)*orientalPatchNum+b,1}(1):(imA.person.patch{i,(k-1)*orientalPatchNum+b,1}(1)+imA.person.patch{i,(k-1)*orientalPatchNum+b,2}(1)),:));
%         pause;
    end
end
%patch�Ѿ�����
%imA.pic=double(imA.pic);imB.pic=double(imB.pic);
%��ʼ��hog����
imA.feature=[];
for i=1:imA.person.num
    for j=1:pN
        imA.person.patchfeature{i,j}=sifthog(imA.pic(imA.person.patch{i,j,1}(2):(imA.person.patch{i,j,1}(2)+imA.person.patch{i,j,2}(2)),...
            imA.person.patch{i,j,1}(1):(imA.person.patch{i,j,1}(1)+imA.person.patch{i,j,2}(1)),:...
            ),6,18);%��ȡ���� 
        imA.feature=[imA.feature,imA.person.patchfeature{i,j}];
    end
end
imA.edgefeat=edgefeature(imA);
imB.feature=[];
for i=1:imB.person.num
    for j=1:pN
        imB.person.patchfeature{i,j}=sifthog(imB.pic(imB.person.patch{i,j,1}(2):(imB.person.patch{i,j,1}(2)+imB.person.patch{i,j,2}(2)),...
            imB.person.patch{i,j,1}(1):(imB.person.patch{i,j,1}(1)+imB.person.patch{i,j,2}(1)),:...
            ),6,18);%��ȡ����      
         imB.feature=[imB.feature,imB.person.patchfeature{i,j}];
    end
%     tmp2=cell(1,6);
%     for j=1:6
%         tmp2{1,j}=[];
%         for k=1:6
%             if j==k
%                 continue
%             else
%                 tmp=min(imB.person.patchfeature{i,j})*0.1+imB.person.patchfeature{i,j};
%                 tmp2{1,j}=[tmp2{1,j},imB.person.patchfeature{i,k}./imB.person.patchfeature{i,j}];  
%             end
%         end
%     end
%     for c=1:6
%         imB.person.patchfeature{i,c}=[imB.person.patchfeature{i,c},tmp2{1,c}];
%     end
end
%ÿ���˵���������im.person.feature��ÿ��patch����������im.person.patchfeature��
imB.edgefeat=edgefeature(imB);
end

