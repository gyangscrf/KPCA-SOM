%test scipt to make realizations and run KPCA and SOM
% the test case is on the gradual deformation example


clear all; close all; clc

model1='gaussian_realz1';
model2='gaussian_realz2';
r1=read_model(model1);
r2=read_model(model2);

%theta vector
theta=0:0.1:1;

%realization matrix
r_ensemble=[];
r_temp=r1*sin(theta*pi)+r2*cos(theta*pi);
r_ensemble=[r_ensemble r_temp];

%run the KPCASOM_rank script
[Y_eig,rank]=KPCASOM_rank(r_ensemble,5);