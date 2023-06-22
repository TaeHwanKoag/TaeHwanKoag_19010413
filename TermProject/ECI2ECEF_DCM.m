function DCM = ECI2ECEF_DCM(toc)


% t = [yyyy,mm,dd,hh,mm,ss] 형태
% t => datetime
dtoc = datetime(toc) ;

% convert datetime to jd
jd = juliandate(datetime(dtoc));

% greenwich theta(g0)
GMST = siderealTime(jd) ;

% eci => ecef z축으로 회전
DCM = [cosd(GMST) sind(GMST) 0 ;
    -sind(GMST) cosd(GMST) 0 ;
    0 0 1];
end