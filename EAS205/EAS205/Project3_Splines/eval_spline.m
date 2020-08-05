function y = eval_spline (coeffs, s)

x = s;
i = floor(s);
length(coeffs(1,:));

%handle edge cases
if i>(length(coeffs(:,1))+1)
    y = NaN;
elseif i<1
    y = NaN;
%
else
    %handle end point
    if i>=length(coeffs(:,1))
    i = length(coeffs(:,1));
    end
    
    %calculate coeffs lin system
    t = x-i;
    y = dot(coeffs(i,:),[1 (t) (t)^2 (t)^3]);
    
end
end

