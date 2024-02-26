clc;
clear;

c = [2 3 4 7];
A = [2 3 -1 4; 1 -2 6 -7];
b = [8; -3];

m = size(A, 1);    %no of rows
n = size(A, 2);    %no of cols

if m <= n
    nCm = nchoosek(n, m);   %caculate nCm
    p = nchoosek(1:n, m);    %matrix of combinations

    sol = [];

    for i=1:nCm
        y = zeros(n, 1);    %vector of zeros

        A1 = A(:, p(i, :));
        x = inv(A1) * b;
    
        if all(x>=0 & x~=inf & x~=-inf)
            y(p(i,:)) = x;
            sol = [sol y];
        end
    end

    z = c * sol;
    [bfs, index] = max(z);
    
    fprintf('Optimal value is %f\n', bfs);
    fprintf('Optimal solution is (%f, %f, %f, %f)\n', sol(:, index));
else
    error('No of unknowns are less than no. of constraints');
end
