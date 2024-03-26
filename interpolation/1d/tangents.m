function tangents(data_matrix)

 [row,col] = size(data_matrix);
 
 % only 2 cols of x and y will contain control points 
 x = data_matrix(1:2,1) ;
 
 y = data_matrix(1:2,2);
 tangent = data_matrix(3:4, 2);
 
 V = zeros(row,col); 

 len = row;
 
 for i = 1:len    

   V(1:2,i) = x.^(i-1); 

 endfor

 for i = 2:len
   
  V(3:4,i) = (i-1)*x.^(i-2);  % tangent eq of cubic polynomial
                              % 3ax^2 + 2bx^1 + c
 endfor

 V = flip(V,2) ;

% x = A\b Denotes the solution to the matrix equation Ax = b
 coefficients = V\data_matrix(:,2);  

% plot x values
 x_vals = linspace(min(x), max(x),100);

% polyval evaluates 
% y = polyval(p,x)
% p(x)=p1xn + p2xn−1 +...+ pnx + pn+1

 y_vals = polyval(coefficients, x_vals);

 plot(x, y, 'ro', x_vals, y_vals, 'b-');
 xlabel('x');
 ylabel('y');
 title('Vandermonde Tangent Polynomial Interpolation');
 legend('Data Points', 'Interpolated Polynomial');


endfunction