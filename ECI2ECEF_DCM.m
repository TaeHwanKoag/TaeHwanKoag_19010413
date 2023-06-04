function DCM = ECI2ECEF_DCM(t)

% t = [yyyy,mm,dd,hh,mm,ss] 형태
% t => datetime
dt = datetime(t);

% convert datetime to jd
jd = juliandate(datetime(dt));

% greenwich theta(g0)
GMST = siderealTime(jd);

% eci => ecef z축으로 회전
DCM = [cosd(GMST) sind(GMST) 0 ;
    -sind(GMST) cosd(GMST) 0 ;
    0 0 1];
end