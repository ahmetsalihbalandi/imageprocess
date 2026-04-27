load procrustes_star.mat;
whos
subplot(1,2,1), plot(base_points(:,1),base_points(:,2),'kd'); hold on;
plot(input_points(:,1),input_points(:,2),'ro'); axis square; grid on

[D,Z,transform] = procrustes(input_points, base_points);
subplot(1,2,2);
plot(input_points(:,1),input_points(:,2),'kd'); hold on;
plot(Z(:,1),Z(:,2),'ro'); axis square; grid on; hold off;