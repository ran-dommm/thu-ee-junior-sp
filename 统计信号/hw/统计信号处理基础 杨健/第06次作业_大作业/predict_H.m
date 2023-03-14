function H = predict_H(a, b, c)
    n = 9;
    alpha = b./(a.^2);
    beta = c./(a.^3);
    Q = zeros(1, (n+1)*(n+2)/2);
    cnt = 1;
    for i = 0:n
        for j = 0:i
            Q(cnt) = alpha.^(i-j) .* beta.^j;
            cnt = cnt+1;
        end
    end
    load('weight.mat', 'w0');
    H = Q*w0;
end