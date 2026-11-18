%% Standard Commands
clc % Clearing Command Window
clearvars % Clear all variables in workspace
load(fullfile('Data', 'waveforms.mat')) % Load "waveforms" dataset
%% PCA 
proj = PCA(waveforms); % Projecting original datset into only 2 dimensions
n = size(proj,1);
%% Applying function to intialise cluster centres
k = 3; % Setting K number of clusters
cluster_centres = initial_cluster_centres(k,proj); % Function to generate initial centroids
%% Defining necessary variables
max_iteration = 9; % Maximum number of iterations that the algorithim will undergo
prev = inf(size(cluster_centres)); % Defining a 'previous cluster centres' variable so the old points can be stored throughout iterations
minimum_change = 0.0000000000001; % Minimum amount of change between the new cluster centres and the old cluster centres before the clusters are deemed to have converged 
%% Running K-means clustering algorithim and plotting results
[cluster_centres,labels] = CustomKMeans(max_iteration,cluster_centres,proj,minimum_change,n,k); % Implementing a function that will run a custom K-Means Clustering algorithim and also visualise the convergence
