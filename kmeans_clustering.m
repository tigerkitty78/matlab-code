% 1. Generate Random 2D Data
rng(1);  % For reproducibility
data = [randn(50,2) + 2; randn(50,2) - 2; randn(50,2)];  % 3 clusters

% 2. Apply K-Means Clustering
K = 3;  % Number of clusters
[idx, C] = kmeans(data, K);  % idx: cluster labels, C: cluster centroids

% 3. Plot the Data with Cluster Labels
figure;
gscatter(data(:,1), data(:,2), idx);  % Scatter plot with colors by cluster
hold on;
plot(C(:,1), C(:,2), 'kx', 'MarkerSize', 15, 'LineWidth', 3);  % Plot centroids
title('K-Means Clustering');
xlabel('Feature 1');
ylabel('Feature 2');
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Centroids');
hold off;
