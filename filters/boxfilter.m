%A = magic(10);

function op = boxfilter(A,win)
  
%A = input('Enter Vector A = ');

[ra,ca] = size(A);

B = zeros(ra,ca);


fac = win*win;

% creating a win X win filter
%bfilter = ones(win)/win^2;
 
%win = input('Enter window size = ');

% mid = uint16(win/2) - 1 % win/2 is adhering to the std rounding off rules

mid = uint16(floor(win/2));

for i = 1:ra 
  for j = 1:ca
    if (i>=mid+1) && (i<=ra-mid) && (j>=mid+1) && (j<=ca-mid)
      intermediate_sum = 0;
%{      
    for a = i-mid:i+mid 
       for b = j-mid:j+mid
         csum += A(a,b)/fac;
       end
      end 
%}
     intermediate_sum = sum(A(i-mid:i+mid, j-mid:j+mid));
     temp = sum(reshape(intermediate_sum, [1,win]));    
     
%      tempimg = double(A(i-mid:i+mid, j-mid:j+mid));
      
      B(i,j) = temp/fac;
%      B(i,j) = uint8(sum(sum(tempimg .* bfilter)));

    endif  
  endfor 
endfor


[rb,cb] = size(B);
op = uint8(B(mid+1:rb-mid, mid+1:cb-mid)); % no boundaries

%op = uint8(B); % image is used in uint8

end 