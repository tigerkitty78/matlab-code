clear all
clc
close all

%generate synthetic data

% Generate synthetic data
numPoints = 100;  % Number of points per class
class1 = [randn(numPoints, 2) + 1.9];  % Class 1 centered at (1,1) 
class2 = [randn(numPoints, 2) + 3.4];  % Class 2 centered at (5,5)

dataset = [class1, class2]';%transpose to get features in columns
dataset=dataset';

plot(dataset(:,1),dataset(:,2),'ro')
title 'randomly gen dataa'

% Combine data into input and target matrices
%inputs = [class1; class2]';  % Transpose to get features in columns
%targets = [zeros(1, numPoints), ones(1, numPoints)];  % 0 for class 1, 1 for class 2

for i=1:size(dataset,1)
    if i<=100
        Class_Lab(i)=1;
    elseif (i>100)
        Class_Lab(i)=2;
    end
end

Class_Lab=Class_Lab';
dataset(:,3)=Class_Lab;
  
   Total_Samples= size(dataset,1);
   Selected_Samples = Total_Samples*0.6;%60 percent 
   assert(Selected_Samples<=Total_Samples);%cannot choose more rows than what is in the matrix
   rand_rows= randperm(Total_Samples);

   k=1;
   j=1;

    for i = 1:size(dataset,1)
        if k<Selected_Samples 
        TR_Temp{i}=dataset(rand_rows(i),:);
        k=k+1;
        else 
            TE_Temp{j}=dataset(rand_rows(i),:);
        k=k+1;
        j=j+1;
        end
    end







