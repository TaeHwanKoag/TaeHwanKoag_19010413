function finalTrueAnomaly = FinalTrueAnomaly(v0, semimajorAxis, eccentricity, t)
    

     mu = 3.986004418 * 10^14; %m^3/s^2
    
    % 초기 Eccentric Anomaly 계산
    trueAnomalyRad = deg2rad(v0);
    
    % 초기 이심근점각 계산
    cosE0 = (eccentricity + cos(trueAnomalyRad)) / (1 + eccentricity * cos(trueAnomalyRad));
    sinE0 = sqrt(1 - cosE0^2);
    
    if v0 > 180
        E0 = 2 * pi - atan2(sinE0, cosE0);
    else
        E0 = atan2(sinE0, cosE0);
    end
    
    % 결과를 0에서 360도 범위로 변환
    E0 = mod(rad2deg(E0), 360);

    

    % 초기 Mean Anomaly 계산
    M0 = deg2rad(E0 - eccentricity * sin(E0));

    % 궤도 주기 계산
    tau = sqrt(semimajorAxis^3/mu) * 2 * pi;

    

    % 주어진 시간에 대한 남은 시간 계산
    j = mod(t, tau);

    % 나중 Mean Anomaly 계산
    M = j / sqrt(semimajorAxis^3/mu) + M0;

    if M > 2*pi

        M = M - 2*pi; 

    end
    

    % 초기 Eccentric Anomaly
    Eb = M;

    %  Eccentric Anomaly 계산
    while true
        E = M + eccentricity * sin(Eb);
        if abs(Eb - E) < 10^(-8)
            break;
        end
        Eb = E;
    end
    

    % 나중 True Anomaly 계산
    y = (sqrt(1 - eccentricity^2)*sin(E))/(1 - eccentricity*cos(E));
    x = ((cos(E) - eccentricity))/(1 - eccentricity*cos(E));
   trueanomaly = atan2(y,x);

   if trueanomaly < 0
       trueanomaly = trueanomaly + 2*pi;
   end
   finalTrueAnomaly = rad2deg(trueanomaly);
   

    

    
end