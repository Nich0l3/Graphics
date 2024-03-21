 %  cubic curves using 4 control points
 
 %% I = [ x1,y1; x2,y2; ..... ; xn, yn]
 
 function op = splines1(I)
   
    N = length(I);
    
    % AX = B
    
    A = zeros(N,N);
    
    x = I(:,1);
    
    for i = 1:N
      
      A(i,:) = [x(i)^3, x(i)^2, x(i)^1, x(i)^0];
      
    endfor
     
    B = I(:,2);
     
    X = linsolve(A,B);
   
    fplot(poly2sym(X));
    
    op = X;
   
    
 endfunction
