function [hog_patches] = hogPatches(img, patchSize, blockSize,patchStep)
%make sure the size of img is 54*36
hog_patches = [];
[h,w,~]=size(img);
y=1;
for i=1:size(img,3)
    imgtmp = single(double(img(:,:,i)));
    %imgtmp=imresize(imgtmp,[54,36]);
    while y+patchSize-1<=h
        x=1;
        while x+patchSize-1<=w
            patch=imgtmp(y:y+patchSize-1,x:x+patchSize-1);
            hog = vl_hog(patch, blockSize,'numOrientations', 8);
            hog = reshape(hog, [], 1);
            if repmat(sqrt(sum(hog.^2,1)),size(hog,1),1)==0
                hog=hog;
            else
                hog=hog./repmat(sqrt(sum(hog.^2,1)),size(hog,1),1);
            end
            hog_patches = [hog_patches ; hog];
            x=x+patchStep;
        end
        y=y+patchStep;
    end
end
% for i=1:size(frames,1)
%     %frames中前两个数分别是所在特征点的横坐标和纵坐标，这里的分patch方法至少要求图像大小能够容纳一个patch的大小
%     f = frames(i,:);
%     x = round(f(1)); y = round(f(2));
%     x = min(max(x, patchSize), size(img, 2) - patchSize);
%     y = min(max(y, patchSize), size(img, 1) - patchSize);
%     patch = img( y - patchSize/2 : y + patchSize/2, x - patchSize/2 : x + patchSize/2);
%     hog = vl_hog(patch, blockSize);
%     hog = reshape(hog, 1, []);
%     hog_patches = [hog_patches ; hog];
% end

end