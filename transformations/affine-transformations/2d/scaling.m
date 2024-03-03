function output = scale(image, fac)
  
  mat = [1 0;
  
         0 1];  
  mat = mat .* fac;
  
  [row, col] = size(image);
  
  output = zeros(row*fac,col*fac);
  
  bright = 2*fac;
  
  for i = 1:row
    for j = 1:col
      current_coordinates = [i;j];
      new_coordinates = ceil(mat*current_coordinates);
      
      new_row_index = new_coordinates(1,1);
      new_col_index = new_coordinates(2,1);
      
      new_element = output(new_row_index, new_col_index);
      
      if new_element == 0
        output(new_row_index, new_col_index) =  image(i,j);
      else 
%        output(new_row_index, new_col_index) = (new_element + image(i,j))/2;
      endif
      
    endfor
  endfor
  
  output = uint8(output);
endfunction