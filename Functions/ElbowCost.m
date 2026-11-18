function [centroids,labels] = ElbowCost(centroids,projection,k)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
arguments (Input)
    centroids
    projection
end

arguments (Output)
    centroid
    labels
end

labels = zeros(n,1); % Creating vector to assign data to each cluster
rows = 3; % Number of rows in subplot
columns = 3; % Number of columns in subplot
figure() % Creating figure for future visualisation

for k = 1:MaxK % Limits the algorithim to a predefined number of maximum iterations2
cost(k) = sum((centroids - projection(i,:)).^2, 2)


% Assigning each data point to closest cluster centre
    for i = 1:n
        J = sum((centroids - projection(i,:)).^2, 2); % J represents the sum of the square distances of each data point to each cluster centre
        [~, labels(i)] = min(J); % Assigning each data point to a cluster based on the smallest distance it has to a cluster centre
    end 

end