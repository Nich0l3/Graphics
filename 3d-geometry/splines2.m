% cubic curve using two control points and there tangents

% % I = [ x1, y1, t1; x2, y2, t2];

function op = splines2(I)

      x = I(:,1);
      t = I(:,3);
      
      B = [I(:,2), I(:,3)];
      B = reshape(B.',[],1);
      
      A = zeros(4,4);
      
      % value of function at control points
      for i = 1:2
        ;
      endfor
      
      % value of funcion at tangents 
      for i = 3:4
        
      endfor
            
      op = linsolve(A,B);

endfunction
  