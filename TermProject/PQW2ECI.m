function answer = PQW2ECI(arg_prg, inc_angle, RAAN)



% R(arg_prg,3)

matp = [cosd(arg_prg), sind(arg_prg), 0;
              -sind(arg_prg), cosd(arg_prg), 0;
              0, 0, 1];

% R(inc_angle,1)
mati = [1, 0, 0;
                  0, cosd(inc_angle), sind(inc_angle);
                  0, -sind(inc_angle), cosd(inc_angle)];

% R(RAAN,3)
  matR = [cosd(RAAN), sind(RAAN), 0;
                      -sind(RAAN), cosd(RAAN), 0;
                      0, 0, 1];

% Perifocal frame to ECI frame transformation matrix
answer = (matp*mati*matR)';
end
