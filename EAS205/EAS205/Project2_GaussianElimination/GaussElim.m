function x = GaussElim (A, b)
%attempts to solve x in matrix equation Ax = b
%Gaussian Elimination in a straightforward manner as you might 
%find in a standard textbook

%AUGMENTED MATRIX
a = [A,b];

for n=1:length(A(:,1))
    %NOTE THIS WHILE LOOP FIXES 0-CASES 
    while a(n,n) == 0
        store = a(n,:);
        a(n,:) = [];
        a = [a;store];
    end
    
    %UPPER TRIANGULATION
    a(((n+1):end),:) = a(((n+1):end),:) - (a(((n+1):end),n)./a(n,n)).*a(n,:);
    a(n,:) = a(n,:)/a(n,n);
end

%BACK SUBSTITUTION
for m = length(A(:,1)):-1:1
if(a(m,m) ~= 0)
    x(m) = a(m,end);
    if m>1 %BASICALLY GETS RREF
    a((1:(m-1)),:) = a((1:(m-1)),:)-(a((1:(m-1)),m)./a(m,m)).*a(m,:);
    end
end

x = x';
end

