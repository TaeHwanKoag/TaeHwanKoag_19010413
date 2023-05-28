function answer = solveRangeInPerifocalFrame(semimajor_axis,eccentricity,true_anomaly)
% unit : semimojor_axis : km, true_anomaly : degree

p = semimajor_axis * (1 - eccentricity^2);

r = p/(1 + eccentricity*cosd(true_anomaly));

answer = [r*cosd(true_anomaly); r*sind(true_anomaly); 0];

end
