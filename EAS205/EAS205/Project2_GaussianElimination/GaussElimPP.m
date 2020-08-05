function x = GaussElimPP (A, b)
%attempts to solve x in matrix equation Ax = b
% The second variant should implement Gaussian Elimination using partial pivoting and row scaling as we discussed in class.

%AUGMENTED MATRIX
a = [A,b];

%EMPTY PARTIAL PIVOTTED MATRIX
anew = [];

%MAX VALUES OF EACH ROW
maxs = max(abs(A),[],2);

%SCALED AUGMENTED MATRIX
a = a./maxs;

%FILL THE PARTIAL PIVOTED MATRIX , NOTE THIS FIXES 0-CASES
for i = 1:length(A(:,1))
    [absMax, ind] = max(abs(a(:,i)));
    anew(end+1,:) = a(ind,:);
    a(ind,:) = [];
end

%UPPER TRIANGULATION
for n=1:length(A(:,1))
    anew(((n+1):end),:) = anew(((n+1):end),:) - (anew(((n+1):end),n)./anew(n,n)).*anew(n,:);
    anew(n,:) = anew(n,:)/anew(n,n);
end

%BACK SUBSTITUTION
for m = length(A(:,1)):-1:1
if(anew(m,m) ~= 0)
    x(m) = anew(m,end);
    if m>1
    anew((1:(m-1)),:) = anew((1:(m-1)),:)-(anew((1:(m-1)),m)./anew(m,m)).*anew(m,:);
    end
end

x = x';
end

