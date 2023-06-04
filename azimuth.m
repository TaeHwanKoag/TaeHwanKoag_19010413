function az = azimuth(ENU)

%1열 east , 2열 north
Re = ENU(:,1);
Rn = ENU(:,2);
AZ = atan2(Re, Rn);
% azimuth가 360 degree를 넘었을때 나머지 연산
% ex) 400 - 360 = 40 degree
AZ = mod(AZ,2*pi);
az = rad2deg(AZ);

% azimuth 가 음수값이 나왔을때 360를 더해준다.
for i = 1:length(az)
    if az(i) < 0
        az(i) = az(i) + 360;
    end

end

end

        






