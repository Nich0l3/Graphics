function [op,cp] = copy(A, win)
  
  [ra,ca] = size(A);
  
  mid = uint16(floor(win/2));
  
  B = zeros(ra+mid*2, ca+mid*2);
  [rb,cb] = size(B);
  
  % imposing A on B
  B(1+mid:rb-mid, 1+mid:cb-mid) = A;
    
  % edge extension
  
  for sel = 1:mid 
    
    B(sel, 1:cb) = B(mid+1, 1:cb);
    B((rb+1)-sel, 1:cb) = B(rb-mid, 1:cb);
    B(1:rb, sel) = B(1:rb, mid+1);
    B(1:rb, (cb+1)-sel) = B(1:rb, cb-mid);
    
  end 
  
  op = uint8(B);  
  
  end