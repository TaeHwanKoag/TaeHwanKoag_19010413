
function result = test(k)
load nav.mat;
if k == 1
a = nav.GPS.a; %m
e = nav.GPS.e; 
i = rad2deg(nav.GPS.i); %rad
w = rad2deg(nav.GPS.omega); %rad
M0 = rad2deg(nav.GPS.M0);
toc = nav.GPS.toc ;
RAAN = rad2deg(nav.GPS.OMEGA);

elseif k == 2
    a = nav.QZSS.a; %m
e = nav.QZSS.e; 
i = rad2deg(nav.QZSS.i); %rad
w = rad2deg(nav.QZSS.omega); %rad
M0 = rad2deg(nav.QZSS.M0);
toc = nav.QZSS.toc ;
RAAN = rad2deg(nav.QZSS.OMEGA);

elseif k == 3
a = nav.BDS.a; %m
e = nav.BDS.e; 
i = rad2deg(nav.BDS.i); %rad
w = rad2deg(nav.BDS.omega); %rad
M0 = rad2deg(nav.BDS.M0);
toc = nav.BDS.toc ;
RAAN = rad2deg(nav.BDS.OMEGA);


end

    
v0 = trueanomaly(M0,e);




pqw2ecimatrix = PQW2ECI(w,i,RAAN);


for t = 1 : 1440

   v = FinalTrueAnomaly(v0,a,e,t*60);
   

PQWR = solveRangeInPerifocalFrame(a,e,v);
PQWV = solveVelocityInPerifocalFrame(a,e,v);


ECIV = pqw2ecimatrix * PQWV;

ECIR = pqw2ecimatrix * PQWR;

ECEFR = ECI2ECEF_DCM(datetime(toc) + minutes(t))*ECIR ;
ECEFV = ECI2ECEF_DCM(datetime(toc) + minutes(t))*ECIV ;

[lat(t),long(t),height(t)] = ecef2geodetic(wgs84Ellipsoid('meter'),ECEFR(1),ECEFR(2),ECEFR(3)); 
[E(t),N(t),U(t)] = ecef2enu(ECEFR(1),ECEFR(2),ECEFR(3),37,127,1000,wgs84Ellipsoid);
AZ(t) = azimuth([E(t),N(t),U(t)]);
El(t) = elevation([E(t),N(t),U(t)],10);

end


figure(1)
geoplot(lat,long,'b-','LineWidth',1);
geolimits([-90,90],[-180,180]);
geobasemap('grayland');
title('groundtrack');


figure(2)
skyplot(AZ,El)
title('skyplot')

result = NaN;
end

