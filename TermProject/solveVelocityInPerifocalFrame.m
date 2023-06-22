function answer = solveVelocityInPerifocalFrame(semimajor_axis,eccentricity,true_anomaly)
%unit : m, degree

p = semimajor_axis * (1 - eccentricity^2); % p = a(1-e^2)

r = p/(1 + eccentricity*cosd(true_anomaly)); % r = p/(1+e*cos(theta))

mu =  3.986004418 * 10^14; % unit : m^3/s^2

answer = sqrt(mu/p) * [-sind(true_anomaly); eccentricity + cosd(true_anomaly); 0];

end
