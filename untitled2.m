data = load('U01_Acc_TimeD_FDay.mat');  % Adjust filename accordingly
whos data
fieldnames(data)  % Display all the field names inside the 'data' struct



% Access the field from the struct
cellArray = data.Acc_TD_Feat_Vec;  % Adjust if needed
class(data.Acc_TD_Feat_Vec)  % Check the type of the field
size(data.Acc_TD_Feat_Vec)   % Check the dimensions of the field


% % If it's a cell array, extract the matrix from it
% featureMatrix = cellArray{1};  % Access the first element of the cell array
% 
% size(featureMatrix)  % Check the size of the feature matrix
% disp(featureMatrix(1:5, :))  % Display the first 5 rows