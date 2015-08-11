function [ Y, eigVector,eigValue ] = kpca_process( r_summary, kernel_para)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%% Gaussian kernel PCA
d=size(r_summary,1);
DIST=distanceMatrix(r_summary);
DIST(DIST==0)=inf;
DIST=min(DIST);
%the sigma squared para (c=5)
para=kernel_para*mean(DIST);
disp('Performing Gaussian kernel PCA...');
%running KPCA for different realizations
[Y, eigVector,eigValue]=kPCA(r_summary,d,'gaussian',para);

end

