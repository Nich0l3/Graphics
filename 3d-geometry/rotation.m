% for now it can do perpendicular rotations

function op = rotation(img, ang)
  
  [row,col] = size(img);
 
  row_mat = zeros(size(image));
  col_mat = zeros(size(image));

  rot_matrix = ([cos(ang), -1*sin(ang); 
                 sin(ang),  cos(ang)]);
                 
  increment_factor = uint16(floor(row/2)); % should be max of row and col

  for i = 1:row 
    for j = 1:col
      
      coordinates = [i - floor(row/2) - 1;j - floor(col/2) - 1]; 
      
      new_coordinates = int16(rot_matrix * coordinates);

      row_mat(i,j) = new_coordinates(1);
      col_mat(i,j) = new_coordinates(2);
    endfor
  endfor
  
  row_mat;
  col_mat;
  
  [index_row,index_col] =  size(row_mat)   ;
 % [col_row,col_col] =  size(col_mat);

  row_shift = abs(min(reshape(min(row_mat), 1, index_col)));
  col_shift = abs(min(reshape(min(col_mat), 1, index_col))) ;
  
  row_mat = row_mat + row_shift + 1
  col_mat = col_mat + col_shift + 1
  
  size(row_mat);
  size(col_mat);
  
  op = zeros(index_row, index_col); % row_mat and col_mat have same dimensions
  
  for i = 1:index_row
    for j = 1:index_col
      
      op( row_mat(i,j) , col_mat(i,j) ) = img(i,j) ;
      
    endfor
  endfor
  
 % disp("input image");
 % size(img)
 % disp("output image")
 % size(op)
 % disp("row_matrix")
 % size(row_mat)
 % disp("col_matrix")
 % size(col_mat)
  
  op = uint8(op);  
  endfunction
