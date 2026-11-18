%% Initialising centroids
k = 3;
[n, ~] = size(proj);

random_indices = randperm(n, k);
cluster_centres = proj(random_indices, :);

prev = inf(size(cluster_centres));
labels = zeros(n,1);

min_convergence = 0.001;
iter = 0;
max_iteration = 10;

figure;

for a = 1:max_iteration
    iter = iter + 1;

    % ---- Assignment step ----
    for i = 1:n
        J = sum((cluster_centres - proj(i,:)).^2, 2);
        [~, labels(i)] = min(J);
    end

    % ---- Plot current clustering ----
    clf;
    scatter(proj(:,1), proj(:,2), 30, labels, 'filled');
    hold on;
    plot(cluster_centres(:,1), cluster_centres(:,2), 'wx', ...
         'MarkerSize', 15, 'LineWidth', 3);
    title(['K-means iteration ', num2str(iter)]);
    xlabel('PC 1');
    ylabel('PC 2');
    axis equal;
    axis tight;
    drawnow;
    pause(0.5);

    % ---- Store previous centroids ----
    prev = cluster_centres;

    % ---- Update step (FIXED) ----
    for m = 1:k
        cluster_points = proj(labels == m, :);

        if ~isempty(cluster_points)
            cluster_centres(m,:) = mean(cluster_points, 1);
        else
            % Reinitialise empty cluster
            cluster_centres(m,:) = proj(randi(n), :);
        end
    end

    % ---- Convergence check ----
    if max(abs(cluster_centres - prev), [], 'all') < min_convergence
        break
    end
end
