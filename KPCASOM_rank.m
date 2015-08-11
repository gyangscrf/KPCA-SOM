function [ Y, rank ] = KPCASOM_rank( input_realizations, kernel_para)

% This is the main funciton to give out the rank of your input realizations
% Input: input_realizations is all the realizations; kernel_para is a
% parameter to specify the sigma in the kernel (i.e., sigma =
% kernel_para * mean dist between different realizations) 
% Output: Y is the coefficent matrix of the eigen vectors, rank is the rank
% of different spatial realizations
% Author: Guang Yang

%input_realizations are organized by columns, each column represents one
%realization

%first call kpca to do dimension reduction 
[Y, ~,eigValue]=kpca_process(input_realizations',kernel_para);

%plot the percetange of variance
ploteigvalue(eigValue);

%Use SOM to get the rank 
%Number of nodes equals number of realizations
NumNodes=size(input_realizations,2);

%calling SOM process
figure;
rank=SOM_process(Y,NumNodes);


%plot the scatters of KPCA first three dimensions colored by the rank
figure;
scatter3(Y(:,1),Y(:,2),Y(:,3),100,rank,'filled');box on;grid on;hold on;
colorbar;
set(gca,'XTickLabel','');
set(gca,'YTickLabel','');
set(gca,'ZTickLabel','');
%connecting the dots by the rank 
ranked_Y=[Y  rank'];
sorted_Y=sortrows(ranked_Y,size(ranked_Y,2));
plot3(sorted_Y(:,1),sorted_Y(:,2),sorted_Y(:,3),'r-','LineWidth',2);



end