function [op,wp] = wrap(A, win)
  
  [ra,ca] = size(A);
  
  mid = uint16(floor(win/2));
  
  B = zeros(ra+win*2, ca+win*2);
  [rb,cb] = size(B);
  
  %imposing A on B
  B(1+mid:rb-mid, 1+mid:cb-mid) = A;
  
 
  
  wp = uint8(B);
  
  end 