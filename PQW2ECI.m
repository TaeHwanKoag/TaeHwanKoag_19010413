function answer = PQW2ECI(arg_prg, inc_angle, RAAN)

% degree 에서 radian으로 변환
a = deg2rad(arg_prg)
b = deg2rad(inc_angle)
c = deg2rad(RAAN)

% R(arg_prg,3)

matp = [cos(arg_prg), sin(arg_prg), 0;
              -sin(arg_prg), cos(arg_prg), 0;
              0, 0, 1];

% R(inc_angle,1)
mati = [1, 0, 0;
                  0, cos(inc_angle), sin(inc_angle);
                  0, -sin(inc_angle), cos(inc_angle)];

% R(RAAN,3)
  matR = [cos(RAAN), sin(RAAN), 0;
                      -sin(RAAN), cos(RAAN), 0;
                      0, 0, 1];

% Perifocal frame to ECI frame transformation matrix
answer = (matp*mati*matR)';
end
