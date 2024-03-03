function out = seg(img)
  
  [img_col, img_row] = size(img);
  
  img_h_array = reshape(img,1, img_col * img_row);  % horizontal array 
  
  % IUWT
  
  c = img_h_array;
  
  h0 = [1, 4, 6, 4, 1]/16; % coefficients of cubic spline function (slef read)
    
  for j = 1:4 % levels of IUWT, 4 recommended by the paper
    for i = 1: img_col * img_row % parsing array
    
      c_prev = c(i);
      
      h_prev = h0;
      zero = 2*j-1;
      h = upsample(h0, zero+1);
      
      c(i) = conv(c_prev,h);
      
    endfor
  endfor
  
  out = c;
end