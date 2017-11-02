% Initialize

track = xlsread('track2017.xlsx');
rows = length(track);

step_size = 0.01;
steps = 0:step_size:rows;

x_column = 1;
y_column = 2;

%% Heightmap

simplified_track = zeros(rows,2);
simplified_track(1,1) = 0;
simplified_track(1,2) = track(1,3);

for row = 2:rows
     simplified_track(row,1) = simplified_track(row-1,1)+ sqrt((track(row,x_column)-track(row-1,x_column))^2 + (track(row,y_column)-track(row-1,y_column))^2);
     simplified_track(row,2) = track(row,3);
end

%% Smooth out heightmap

smooth_track = smooth(simplified_track(:,2),50);
%plot(simplified_track(:,1),heightmap(:,1),simplified_track(:,1),simplified_track(:,2));

heightmap = zeros(1660,2);
heightmap(:,1) = 0:1:1659;
heightmap(:,2) = smooth_track(:);

save('track_heightmap.mat','heightmap');

% Smooth anglemap
anglemap = zeros(1660,2);
anglemap(:,1) = 0:1:1659;

for n = 2:1:1660
    anglemap(n,2) = atan(heightmap(n,2)-heightmap(n-1,2));
end
smooth_angle_track = zeros(1660,2);
smooth_angle_track(:,2) = smooth(anglemap(:,2),25);
smooth_angle_track(:,1) = 0:1:1659;

plot(smooth_angle_track(:,2));
hold on
plot(anglemap(:,2));
save('track_angles.mat','smooth_angle_track')
grid on



