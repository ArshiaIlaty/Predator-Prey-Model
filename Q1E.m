% Define parameters
a = 1;
b = 5;
d = 0.2;

% Define the grid for u and v
[u, v] = meshgrid(0.1:0.01:0.85, 0.1:0.01:0.85);

% Calculate the derivatives for the vector field
du_dt = u .* (1 - u) - (a .* u .* v) ./ (u + d);
dv_dt = b .* v .* (1 - (v ./ u));

% Plot the nullclines
figure;
hold on;

% Nullcline for du/dtau = 0
contour(u, v, du_dt, [0, 0], 'LineWidth', 2, 'DisplayName', 'Nullcline for du/dtau = 0');

% Nullcline for dv/dtau = 0 (v = u)
contour(u, v, v - u, [0, 0], 'LineWidth', 2, 'DisplayName', 'Nullcline for dv/dtau = 0');

% Add the vector field using quiver
quiver(u, v, du_dt, dv_dt, 'k');

% Set plot limits and labels
xlim([0.1 0.85]);
ylim([0.1 0.85]);
xlabel('u');
ylabel('v');
title('Phase Portrait with Nullclines and Vector Field');
legend;

hold off;
