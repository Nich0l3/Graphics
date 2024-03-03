%A = magic(10);

function boxf = medfilter1(A,win)
 
[r,c] = size(A);
B = zeros(r,c);

tempimg = zeros(1,win*win) ;

% mid = uint16(win/2) - 1 % win/2 is adhering to the std rounding off rules

mid = uint16(floor(win/2));

for i = 1:r
  for j = 1:c
    if (i>mid) && (i<r-(mid-1)) && (j>(mid)) && (j<c-(mid-1))
      tempimg = reshape(A(i-mid:i+mid, j-mid:j+mid),[1,win*win]);
      
      tempimg = sort(tempimg);

      B (i, j) = tempimg(1, uint16(win*win)/2);
      
%      disp(tempimg);
%      disp(B(i, j));
    end 
  end
end

boxf = uint8(B); % image is used in uint8

end 