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

save('heightmap.mat','heightmap');


