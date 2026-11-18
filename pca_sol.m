% pca_sol.m

%% Loading and plotting the data

load waveforms.mat % load data

figure(1)
subplot(231)
plot(waveforms') % need to transpose here to show each of the 3000+ spikes as separate line
title('Original data')
xlim([1 21])
xlabel('Time')
ylabel('Voltage')

% It looks like the data 'clusters' into different spike shapes, but it is
% hard to tell how many!

%% PCA and plotting the data in low-dimensional space

C = cov(waveforms);     % calculate covariance matrix
[V,D] = eig(C);         % calculate eigendecomposition

[d,ii] = sort(diag(D),'descend');    % sort eigenvalues
idx = find((cumsum(d)/sum(d))>0.9,1);   % find # of dims needed to reach >90% variance

Vlo = V(:,ii(1:idx));          % extract eigenvectors

proj = waveforms*Vlo;          % project data into lower dimensional PCA space

subplot(232)
plot(proj(:,1),proj(:,2),'o');  % plot projected 2D data as scatter plot
title('Projected data')
xlabel('PC 1')
ylabel('PC 2')

% Three distinct clusters emerge! There are therefore like three different
% neurons in this data set generating three somewhat different looking
% spike shapes.

%% Manually setting decision boundaries

thres1 = 0.5; % the two bottom clusters can be divided by drawing a line at 0.5 on x axis
thres2 = 0.5; % the top cluster can be divided from the bottom ones by drawing a line at 0.5 on y axis

subplot(232)
line([thres1 thres1],[-3 thres2],'color','k') % let's add dividing lines to the plot
line([-3 3],[thres2 thres2],'color','k')

neuron = zeros(1,size(waveforms,1)); % this vector will contain neuron id (1,2, or 3) for each sample
neuron(proj(:,2)>thres2) = 3;
neuron(proj(:,2)<thres2 & proj(:,1)<thres2) = 1;
neuron(proj(:,2)<thres2 & proj(:,1)>thres2) = 2;

% let's plot all waveforms again but coloured by neuron
subplot(233)
hold on
plot(waveforms(neuron==1,:)','r')
plot(waveforms(neuron==2,:)','g')
plot(waveforms(neuron==3,:)','b')
xlim([1 21])
title('Clustered data')
xlabel('Time')
ylabel('Voltage')

% let's generate a different subplot for each neuron for clarity
subplot(234)
plot(waveforms(neuron==1,:)','r')
xlim([1 21])
title('Neuron 1')
xlabel('Time')
ylabel('Voltage')

subplot(235)
plot(waveforms(neuron==2,:)','g')
xlim([1 21])
title('Neuron 2')
xlabel('Time')
ylabel('Voltage')

subplot(236)
plot(waveforms(neuron==3,:)','b')
xlim([1 21])
title('Neuron 3')
xlabel('Time')
ylabel('Voltage')
