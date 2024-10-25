
clear all
clc
close all

folderPath = 'C:\Users\dasantha\Desktop\CW-Data\CW-Data';  % this is the folder the data files are in
files = dir(fullfile(folderPath, '*.mat'));  % Get all .mat files

% Initialize allFeatures to an empty array
allFeatures = [];  % Initialize here
labels = [];  % Initialize labels if they are needed later


for i = 1:10
    % Construct the full file path
    fileName = sprintf('U%02d_Acc_TimeD_FDay.mat', i);
    data = load(fullfile(folderPath, fileName));  % Load the file

% Access the field from the struct
cellArray = data.Acc_TD_Feat_Vec;  % Adjust if needed

% If it's a cell array, extract the matrix from it
featureMatrix = data.Acc_TD_Feat_Vec;  % Directly access the field

size(featureMatrix)  % Should display [36, 88]
disp(featureMatrix(1:5, :))  % Display the first 5 rows


    %featureMatrix = data.featureMatrix;  % Extract the feature matrix
    allFeatures = [allFeatures; featureMatrix];  % Concatenate for all users

      % Assuming labels are also stored in each .mat file
    if isfield(data, 'labels')  % Check if labels exist in the current file
        labels = [labels; data.labels];  % Concatenate labels
    else
        warning('Labels not found in file: %s', fileName);
    end
end

% Check sizes after loading all files
fprintf('Size of allFeatures: %d x %d\n', size(allFeatures));
fprintf('Size of labels: %d\n', size(labels, 1));

    normalizedFeatures = normalize(allFeatures, 'range');  % Scale between 0 and 1

    % Define and configure the neural network
net = feedforwardnet([10, 5]);  % 2 hidden layers

% Divide data into training and testing sets
trainRatio = 0.7;
[trainInd, ~, testInd] = dividerand(size(normalizedFeatures, 1), trainRatio, 0, 1 - trainRatio);


% Check if labels are sufficient for the training indices
if size(labels, 1) < size(normalizedFeatures, 1)
    error('The number of labels is less than the number of feature samples. Adjust your data accordingly.');
end
% Extract training and testing sets
X_train = normalizedFeatures(trainInd, :);
y_train = labels(trainInd);  % Assuming you have labels loaded
X_test = normalizedFeatures(testInd, :);
y_test = labels(testInd);

% Train the neural network
[net, tr] = train(net, X_train', y_train');

% Evaluate the performance on the test set
y_pred = net(X_test');
mseValue = perform(net, y_test', y_pred);
fprintf('MSE: %.4f\n', mseValue);



% Check the size of the combined data





data = load('U01_Acc_TimeD_FDay.mat');  % Replace with your actual file name
whos data  % Shows variables, sizes, and types inside the file
featureMatrix = data.featureMatrix;  % Adjust this to match the variable name
labels = data.labels;  % Example: Check if labels are stored in the MAT file
