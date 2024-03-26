function linearinterpolation(data_matrix, interpolation_point)
  
 data_matrix = sortrows(data_matrix);
 
x = data_matrix(:,1); % x values
y = data_matrix(:,2); % corresponding y values

% Value to interpolate
x_interp = interpolation_point;

% Find the indices of the two points surrounding x_interp
lower_index = find(x <= x_interp, 1, 'last');
upper_index = find(x >= x_interp, 1, 'first');

% Perform linear interpolation
slope = (y(upper_index) - y(lower_index)) / (x(upper_index) - x(lower_index));
interpolated_value = y(lower_index) + slope * (x_interp - x(lower_index));

% Display the interpolated value
fprintf('Interpolated value at x = %.2f is y = %.2f\n', x_interp, interpolated_value);

% Plot the original data points and the interpolation
plot(x, y, 'ro', x_interp, interpolated_value, 'bx');
xlabel('x');
ylabel('y');
title('Linear Interpolation');
legend('Data Points', 'Interpolated Value');

  
  endfunction