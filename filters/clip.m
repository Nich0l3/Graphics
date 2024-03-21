function [op] = clip(A, win)
  
  [ra,ca] = size(A);  
  
  mid = uint16(floor(win/2));
  
  B = zeros(ra+mid*2,ca+mid*2); % x2 FOR BOTH SIDES

  B(1+mid:ra+mid,1+mid:ca+mid) = A;
  
 % extended image by zeros 
  [rb, cb] = size(B);
   
  op = uint8(B);
  
 end