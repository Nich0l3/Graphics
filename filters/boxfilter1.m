%A = magic(10);

function boxf = boxfilter1(A,win)
  
%A = input('Enter Vector A = ');
[r,c] = size(A);
B = zeros(r,c);

fac = win*win;

% creating a win X win filter
%bfilter = ones(win)/win^2;
 
%win = input('Enter window size = ');

mid = uint16(win/2) - 1 % win/2 is adhering to the std rounding off rules

for i = 1:r
  for j = 1:c
    if (i>mid) && (i<r-(mid-1)) && (j>(mid)) && (j<c-(mid-1))
      
   
       tempint = sum(sum(A(i-mid:i+mid, j-mid:j+mid)));
       %disp(tempint), disp("\n");
       %break
      B(i,j) = tempint / fac;
%      B(i,j) = uint8(sum(sum(tempimg .* bfilter)));
    end 
  end
end

boxf = uint8(B); % image is used in uint8

end 