%% Smooth out heightmap

smooth_track = smooth(track(:,1),25);

% Smooth anglemap
anglemap = zeros(1941,2);
anglemap(:,1) = track(:,2);

for n = 2:1:1941
    anglemap(n,2) = (smooth_track(n)-smooth_track(n-1))/(anglemap(n,1)-anglemap(n-1,1));
end
anglemap(:,2) = smooth(anglemap(:,2),25);
%plot(anglemap(:,2));
%grid on
save('track_angles.mat','anglemap')




