function (O1, O2) = reflect(img)
  
  [row, col] = size(img);
  
  O1 = zeros([row col]);
  O2 = zeros(size(img));
  
  
  % about vertical axis 
  for i = 1:1:row
    for j = col:-1:1;
      
      current_coordinates = [i;j];
      O1 (i,col-j + 1) = img(i,j); % parsing starts with 1
      
      
      
    endfor
  endfor
  
  endfunction