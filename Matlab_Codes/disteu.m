function [ d ] = disteu(x, y)

[M, N] = size(x);
[M2, P] = size(y);
d = zeros(N, P);


if (M ~= M2)
    error('Matrix dimensions do not match.')
end


if (N < P)
    copies = zeros(1,P);
    
    for n = 1:N
        d(n,:) = sum((x(:, n+copies) - y) .^2, 1);
    end
else
    copies = zeros(1,N);
    
    for p = 1:P
        d(:,p) = sum((x - y(:, p+copies)) .^2, 1)';
    end
end

d = d.^0.5;
end