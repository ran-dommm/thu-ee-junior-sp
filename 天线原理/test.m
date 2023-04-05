e = 1e-2;
x = linspace(0, 10, 1000); % distance from dipole

theta = pi/2; % angle from dipole axis

% exact formula
E = sqrt((1-1./((2*pi*x).^2)).^2 + (1./(2*pi*x)).^2) ./ (x);
E_db = 10*log10(abs(E));

% far-field approximation
E_ff = 1 ./ x;
E_ff_db = 10*log10(abs(E_ff));

err = 10*log10(abs(1-E_ff./E));

% plot
plot(10*log10(x), E_db, 'b', ...
         10*log10(x), E_ff_db, 'r--',...
         10*log10(x), err, 'g');
xlabel('Distance (in wavelengths)');
ylabel('Electric field magnitude (in dB)');
legend('Exact formula', 'Far-field approximation','err');
grid on;
