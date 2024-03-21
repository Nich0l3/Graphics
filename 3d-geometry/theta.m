function op = theta(ang)
  
    matrix = int8( [cos(ang), -1*sin(ang); 
    sin(ang), cos(ang)] );
    
    op = matrix;
   
    
   endfunction