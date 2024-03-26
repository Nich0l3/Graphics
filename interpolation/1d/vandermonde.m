function vandermonde(data_matrix)
  
 data_matrix = sortrows(data_matrix);
 
x = data_matrix(:,1); 
y = data_matrix(:,2); 

len = length(x);

V = zeros(len);

for i = 1:len

  V(:,i) = x.^(i-1);

endfor

V = flip(V,2); % flip in rows

% x = A\b Denotes the solution to the matrix equation Ax = b
coefficients = V\y;  

% plot x values
x_vals = linspace(min(x), max(x),100);

% polyval evaluates 
% y = polyval(p,x)
% p(x)=p1xn + p2xn−1 +...+ pnx + pn+1

y_vals = polyval(coefficients, x_vals);

plot(x, y, 'ro', x_vals, y_vals, 'b-');
xlabel('x');
ylabel('y');
title('Vandermonde Polynomial Interpolation');
legend('Data Points', 'Interpolated Polynomial');


endfunction