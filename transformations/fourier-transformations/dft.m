function op = dft(i)
  
  N = length(i);                % number of samples
  T = 0.01;                     % fundamental time period 
  
  n = 0:N-1;                    % nth harmonic
  n = reshape(n,length(n),1);   % reshaping for making the required 2D matrix
  
  k = 0:N-1;                    % kth sample
  
  
  %sig be real
  
  fac1 = i;
  fac2 = exp(-1i * ( (2*pi)/N ) .* n * k );
  
  op = fac1 * fac2 ;
  
  op = sum(op);
  
  end