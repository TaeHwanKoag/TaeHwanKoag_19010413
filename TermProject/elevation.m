function el = elevation(ENU,el_mask)

% 높이
Ru = ENU(:,3);

%east, north vector의 크기
R_en = vecnorm(ENU(:,1:2),2,2);
%elevation angle = arctan(height/sqrt(Rn^2 + Re^2))
el = atan2(Ru,R_en);
el = rad2deg(el);


for i = 1 : length(el)

    if el(i) < el_mask

        el(i) = NaN;
    end
end




end