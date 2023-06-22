%초기 trueanomaly
function initialtrm =trueanomaly(M0,e)
M0 = deg2rad(M0);
Eb = M0;

while true
    E = M0 + e*sin(Eb);
    if Eb == E


        break
    end
    Eb = E;
    
    
end

num = sqrt(1-e^2)*sin(E)/(1-e*sin(E));%분자 
den = (cos(E)-e)/(1-e*cos(E)); %분모


tra = (atan2(num,den));
initialtrm = rad2deg(tra); %trueanomaly unit "degree"
if initialtrm < 0

    initialtrm = initialtrm + 360;

end


end






