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

%% Extrapolate Heightmap

smooth_track_cubic = zeros(length(steps),2);
smooth_track_cubic(:,1) = steps;
smooth_track_cubic(:,2) = pchip(simplified_track(:,1),simplified_track(:,2),steps);
save('smooth_track.mat', 'smooth_track_cubic');

%% Anglemap

track_with_angles = simplified_track;
track_with_angles(1,2) = 0;

for row = 2:rows
   track_with_angles(row,2) = tan((simplified_track(row,2)-simplified_track(row-1,2))/(simplified_track(row,1)-simplified_track(row-1,1))); 
end

% Extrapolate Anglemap

smooth_anglemap = zeros(length(steps),2);
smooth_anglemap(:,1) = steps;
smooth_anglemap(:,2) = pchip(track_with_angles(:,1),track_with_angles(:,2),steps);
save('smooth_track_angles.mat','smooth_anglemap');


