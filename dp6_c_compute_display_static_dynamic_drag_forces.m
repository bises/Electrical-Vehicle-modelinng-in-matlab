N = 90;
% C : Static and Dynamic drag forces
fprintf('C : Static and Dynamic drag forces: Part C\n');
fprintf('C1: Static Drag forces: Fwt, Fh\n');

% Static Drag forces calculations
phi = h/100;
Fwt = (Crr + Cbas) * Wnet * cos(phi);
Fh  = (Crr + Cbas) * Wnet * sin(phi);

% Display Static Dragforce Calculations
fprintf('Crr + Cbas                     = %7.2f\n',Crr+Cbas);
fprintf('phi = (h/100), radians         = %7.2f\n',phi);
fprintf('sin(phi)                       = %7.2f\n',sin(phi));
fprintf('cos(phi)                       = %7.2f\n',cos(phi));
fprintf('Fwt, Drag-Force-weight, lbs    = %7.2f\n',Fwt);
fprintf('Fh, Drag-force-hill-climb, lbs = %7.2f\n\n',Fh);

% Dynamic Drag forces calculations
Fwt   = Fwt + zeros(1,N);
Fh    = Fh + zeros(1,N);
Uv    = 1:N;
Fa    = (Cd * A * Uv .* Uv)/391;
x     = Uw./Uv;
Crwf  = (0.98 * x.^2 + 0.6 * x) * Crw - 0.4 * x;
Fw    = (Crwf .* Fa);
Ftot  = Fwt + Fh + Fa + Fw;
tireTorque = Cttmf * Ftot;
tirePower  = (tireTorque .* Uv * revPerMile)/(5252 * 60);

% Displaying dynamic drag force calculations
fprintf('C2: Static and Dyanamic Drag forces\n');
fprintf('\tFwt, Fh, Crwf, Fw, Fwot\n');
fprintf('Uv mph\t');
for i = 10:10:90
  fprintf('%8.0f',Uv(i));
end
fprintf('\nFwt,lbs\t');
for i = 10:10:90
  fprintf('%8.0f',Fwt(i));
end
fprintf('\nFh, lbs\t');
for i = 10:10:90
  fprintf('%8.0f',Fh(i));
end
fprintf('\nFa, lbs\t');
for i = 10:10:90
  fprintf('%8.0f',Fa(i));
end
fprintf('\nCrwf,lbs');
for i = 10:10:90
  fprintf('%8.2f',Crwf(i));
end
fprintf('\nFw, lbs\t');
for i = 10:10:90
  fprintf('%8.0f',Fw(i));
end
fprintf('\nFtot,lbs');
for i = 10:10:90
  fprintf('%8.0f',Ftot(i));
end
fprintf('\n\n');

fprintf('C: DYANAMIC EQUATIONS: STATIC & DYANAMIC DRAG FORCES\n');
fprintf('C1: DYANAMIC EQUATIONS:\n');
fprintf('phi = h/100\n');
fprintf('Fwt = (Crr + Cbas) * Wnet * cos(phi)\n');
fprintf('Fh = (Crr + Cbas) * Wnet * sin(phi)\n\n');

fprintf('C2: DYNAMIC EQUATIONS:\n');
fprintf('Fa(i) = Cd * A * Uv(i) * Uv(i) / 391;\n');
fprintf('Crwf[i]=(0.98 * x^2 + 0.6 * x) * Crw - 0.40 * x;\n');
fprintf('\t where, x = windSpeed / Uv(i];\n');
fprintf('Fw[i] = Crwf[i] * Fa[i];\n');
fprintf('Ftot[i] = Fwt + Fh + Fa[i] + Fw[i];\n');
fprintf('tireTorque[i] = Cttmf * Ftot[i];\n');
fprintf('tirePower[i] = (tireTorque[i] * Uv[i] * revPerMile) / (5252*60);\n');

fprintf('END STATIC & DYNAMIC DRAG FORCES: DP6: PART C\n');

%Plot of drag forces
subplot(3,2,1);
plot(Uv,Fwt);
xlabel('Uv, mph');
ylabel('Fwt,lbs');

subplot(3,2,2);
plot(Uv,Fh);
xlabel('Uv, mph');
ylabel('Fh,lbs');

subplot(3,2,3);
plot(Uv,Fa);
xlabel('Uv, mph');
ylabel('Fa,lbs');

subplot(3,2,4);
plot(Uv,Crwf);
xlabel('Uv, mph');
ylabel('Crwf,lbs');

subplot(3,2,5);
plot(Uv,Fw);
xlabel('Uv, mph');
ylabel('Fw,lbs');

subplot(3,2,6);
plot(Uv,Ftot);
xlabel('Uv, mph');
ylabel('Ftot,lbs');





  
