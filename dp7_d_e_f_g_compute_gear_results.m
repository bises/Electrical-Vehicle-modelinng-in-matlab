% Part D: Tire Parameters
fprintf('PART D: TIRE PARAMETERS:\n');
fprintf('Acharya, Bishesh; Spring 2016; Update Date : %s\n',date());

% Calculations of tire parameters
Tt = Cttmf * Ftot;
Pt = Tt .* Uv * revPerMile/(5252 * 60);

%Displaying Mototr parameters
fprintf('Uv mph           '); fprintf('%6.0f',Uv(10:10:90)); fprintf('\n');
fprintf('d1. Tt, ft-lbs   '); fprintf('%6.0f',Tt(10:10:90)); fprintf('\n');
fprintf('d2. Pt, hp       '); fprintf('%6.0f',Pt(10:10:90)); fprintf('\n\n');

% Part E: GEAR RESULTS
fprintf('PART E: GEAR RESULTS:\n');

%Calcuions of Gear results
G = [8 6 4 3 2];  %Gear Ratios
counter = 0;
fprintf('Gear ratios[1:5]:    '); fprintf('%6.0f',G(1:5)); fprintf('\n');
for Gi = G
  counter = counter + 1;
  fprintf('GEAR RESULTS:  %d\n',counter);
  fprintf('Uv mph           '); fprintf('%6.0f',Uv(10:10:90)); fprintf('\n');

  % Calculaions of Motor Parameters
  Tm = Tt/(Gi * Nd);
  Rm = Uv * Gi * revPerMile / 60;
  Im = power(Tm / motorK , 1 / motorN);
  Temp1 = power(Tm,motorB);
  Vm = (Rm * motorD)./((motorA ./ Temp1) + motorC);
  Pm = Im .* Vm / 1000.0;

  %Display of the Motor Parameters
  fprintf('d1. Tt, ft-lbs   '); fprintf('%6.0f',Tt(10:10:90)); fprintf('\n');
  fprintf('d2. Pt, hp       '); fprintf('%6.1f',Pt(10:10:90)); fprintf('\n');
  fprintf('e1. Tm, ft-lbs   '); fprintf('%6.0f',Tm(10:10:90)); fprintf('\n');
  fprintf('e2. Rm, rpm      '); fprintf('%6.0f',Rm(10:10:90)); fprintf('\n');
  fprintf('e3. Im, amps     '); fprintf('%6.0f',Im(10:10:90)); fprintf('\n');
  fprintf('e4. Vm, volts    '); fprintf('%6.0f',Vm(10:10:90)); fprintf('\n');
  fprintf('e5. Pm, volts    '); fprintf('%6.1f',Pm(10:10:90)); fprintf('\n');

  % Calculations of Battery-Pack Parameters 
  Pbp = Pm / (Nc * motorEff);
  Vbpmax = batteryVolts * numBatPerString;
  Ibp = Pbp * 1000.0 / Vbpmax;
  Rbp = batteryOhms * numBatPerString / numBatStrings;
  Vbp = Vbpmax - Rbp * Ibp;
  
  %Display of the B-P parameters
  fprintf('f1. Pbp, kw      '); fprintf('%6.1f',Pbp(10:10:90)); fprintf('\n');
  fprintf('f2. Ibp, amps    '); fprintf('%6.0f',Ibp(10:10:90)); fprintf('\n');
  fprintf('f3. Vbp, amps    '); fprintf('%6.0f',Vbp(10:10:90)); fprintf('\n');
  
  % Calculations of Vehicle Parameters
  x1 = power(Ibp,peukertExp);
  IbpPkt = peukertAmps * numBatStrings;
  Dvr = Uv .* IbpPkt ./ x1;
  
  % Display of vehicle parameters
  fprintf('g1. Dvr, miles   '); fprintf('%6.0f',Dvr(10:10:90)); fprintf('\n\n');
end

fprintf ('PART: D, E, G, G: DYNAMIC EQUATIONS\n');
fprintf ('D, E, F, G: TIRE, MOTOR, BAT-PACK, VEHICLE\n');
fprintf ('Tire parameters: \n');
fprintf ('Tt(i) = Cttmf * Ftot(i);  \n');
fprintf ('Pt(i) = Tt(i) * Uv(i) * revPerMile / (5252 * 60); \n');
fprintf ('Motor parameters: \n');
fprintf ('Tm(i) = Tt(i) / (G(k) * Nd); \n');
fprintf ('Rm(i) = Uv(i) * G(k) * revPerMile / 60;  \n');
fprintf ('Im(i) = power(Tm(i) / motorK, 1 / motorN);  \n');
fprintf ('Temp1 = power (Tm(i), motorB); \n');
fprintf ('Vm(i) = (Rm(i) * motorD) / ((motorA / Tempi) + motorC);  \n');
fprintf ('Pm(i) = Im(i) * Vm(i) / 1000.0;  \n');
fprintf ('Battery-pack parameters: \n');
fprintf ('Pbp(i) = Pm(i) / (Nuc * Num); \n');
fprintf ('Ibp(i) = Pbp(i) * 1000.0 / Vbpmax;  \n');
fprintf ('Vbp(i) = Vbpmax - Rbp * Ibp(i);  \n');
fprintf ('Vehicle parameters:  \n');
fprintf ('x1 = power(Ibp(i), peukertExp); \n');
fprintf ('Dvr(i) = Uv(i) * Ibppkt / x1; \n');

