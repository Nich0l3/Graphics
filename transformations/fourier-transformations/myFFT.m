function X = myFFT(x)
    N = length(x);
    
    % Check if input size is a power of 2
    if bitand(N, N-1) ~= 0
        error('Input size must be a power of 2.');
    endif
    
    if N == 1
        X = x;
    else
        % Divide input into even and odd indices
        x_even = myFFT(x(1:2:end));
        x_odd = myFFT(x(2:2:end));
        
        % Compute twiddle factors
        W = exp(-2i*pi*(0:N/2-1)/N);
        
        % Combine even and odd indices using twiddle factors
        X = [x_even + W .* x_odd, x_even - W .* x_odd];
    endif
end
        