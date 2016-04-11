function [ feat ] = sifthog( img,blockSize,patchSize )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%load('codebook&features.mat');
img=double(img);
img=imresize(img,[36,36]);
img=round(img);feat1 = hogPatches(img,patchSize, blockSize,patchSize/2);
feat2=colorHisto(img);
feat=[feat1;feat2];
%feat =  feature_histogram(codebook, feat);

end

