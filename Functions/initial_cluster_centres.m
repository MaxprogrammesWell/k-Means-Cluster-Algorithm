function [cluster_centres] = initial_cluster_centres(k,projected_dataset)
% Initialising cluster centrers
% This function takes the total number of data points in the projected
% datset and generates 'k' amount of positions from that datset. Finally,
% the cluster centres are initialised by retrieving the datapoint
% equivalent to the generated position from earlier in the function.
arguments (Input)
    k % Total number of clusters
    projected_dataset % The data after implementing PCA
end

arguments (Output)
    cluster_centres % Initialised cluster centres
end

[n, ~] = size(projected_dataset); % Defines n as the size of projected dataset whilst ignoring the rows

random_indices = randperm(n, k); % Randomsing to get 3 numbers from 1 to n
cluster_centres = projected_dataset(random_indices, :); % Retrieving random indicies from the projected datset to intialise cluster centres
end