k-Means Cluster Algorithm to assign 2D waveforms to a neuron.

PCA is used to reduce the dimensionality of spike waveforms into 2 dimensions. 
3 cluster centroids are placed within the dataset, and every datapoint is assigned to its closest cluster. New centroids are calculated using the average distance between each data point and its assigned cluster. 
These steps reoccur until the cluster assignments do not change (less than a minimal tolerance value).
