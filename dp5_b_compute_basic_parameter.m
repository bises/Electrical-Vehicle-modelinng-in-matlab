fprintf('Lamar-EVSim1: DP5: COMPUTING BASIC OUTPUT PARAMETERS:\n'); 
fprintf('PART B B1. Wnet; B2. Battery Pack; B3. Ebpkwh, aveMileage; B4. Cttc \n');
fprintf('Update      :	%s \n\n',date);

% B1. Calculation of Overall Vehicle Weight
Wbp   = Wb * numBatPerString * numBatStrings;
Wa    = Wmot + Wbp + Wc + Wch +Wmisc;
Wgain = Wa - Wr;
Wnet  = Wvcw +Wgain;

% Displying the Overall Vehicle Weight
fprintf('B1. Calculation of Overall Vehicle Weight\n');
fprintf('a. Wbp, Weight of battery pack, lbs  = %7.2f\n',Wbp);
fprintf('b. Wmot, Weight of motor, lbs        = %7.2f\n',Wmot);
fprintf('c. Wc, Weight of controller, lbs     = %7.2f\n',Wc);
fprintf('d. Wch, Weight of charger, lbs       = %7.2f\n',Wch);
fprintf('e. Wmisc, Misc weight added, lbs     = %7.2f\n',Wmisc);
fprintf('f. Wa, Weight added, lbs             = %7.2f\n',Wa);
fprintf('g. Wr, Weight removed, lbs           = %7.2f\n',Wr);
fprintf('h. Wgain, Net weight gain, lbs       = %7.2f\n',Wgain);
fprintf('i. Wvcw, Vehicle curb weight, lbs    = %7.2f\n',Wvcw);
fprintf('h. Wnet, Net vehicle weight, lbs     = %7.2f\n',Wnet);

% Displaying the dyanamic equation
fprintf('B1: DYNAMIC EQUATIONS:\n');
fprintf('Wbp = Wb * numBatPerString * numBatStrings;\n');
fprintf('Wa = Wmot + Wbp + Wc + Wch + Wmisc;\n');
fprintf('Wgain = Wa - Wr;\n');
fprintf('Wnet = Wvcw + Wgain;\n\n');

% B2. Battery pack overall parameters:
bpMaxVolts  = batteryVolts * numBatPerString;
bpMaxAmps   = batteryMaxAmps * numBatStrings; 
bpOhms      = batteryOhms * numBatPerString / numBatStrings;

%Displaying Battery pack overall parameters
fprintf('B2: BATTERY PACK OVERALL PARAMETERS:\n');
fprintf('bpMaxVolts, volts  = %7.2f\n', bpMaxVolts);
fprintf('bpMaxAmps, amps    = %7.2f\n', bpMaxAmps);
fprintf('bpOhms, ohms       = %7.2f\n', bpOhms);

% Displayint hte dyanamic equations
fprintf('B2: DYNAMIC EQUATIONS\n');
fprintf('bpMaxVolts = batteryVolts * numBatPerString;\n');
fprintf('bpMaxAmps  = batteryMaxAmps * numBatStrings;\n');
fprintf('bpOhms     = batteryOhms * numBatPerString / numBatStrings;\n\n');

% B3. BATTERY PACK ENERGY & VEHICLE EPA MILEAGE 
Ebpkwh      = (batteryAmpHrs * numBatPerString * numBatStrings)/1000.0;
aveVehRange = (Ebpkwh * 1000) / (Ecc * Wnet);

% Displaying BATTERY PACK ENERGY & VEHICLE EPA MILEAGE
fprintf('B3. BATTERY PACK ENERGY & VEHICLE EPA MILEAGE\n');
fprintf('Ebpkwh, kwh        = %7.2f\n', Ebpkwh);
fprintf('vehRangeAve, miles = %7.2f\n', aveVehRange);

%Displaying  Dynamic Equations
fprintf('B3: DYNAMIC EQUATIONS:\n');
fprintf('Ebpkwh = (batteryAmpHrs * numBatPerString * numBatStrings)/1000.0;\n');
fprintf('aveVehRange = (Ebpkwh * 1000) / (Ecc * Wnet);\n\n');

% B4: COMPUTING TIRE TORQUE CONSTSNT, Cttc:
tireSWH           = tireWidth * (tireAR/100) / (10 * 2.54); 
wheelDia          = 2 * tireSWH + rimDia; 
disPeCrev         = 3.14 * wheelDia; 
revPerMile_wotif  = (1760 * 3 * 12) / disPeCrev; 
revPerMile        = revPerMile_wotif / Ctif;
Cttmf             = 840.34 / revPerMile;

% Displaying the computed tyre torque constants
fprintf('B4: COMPUTING TIRE TORQUE CONSTSNT, Cttc:\n');
fprintf('\tAlso known as tire torque multiplication factor Cttmf\n');
fprintf('tireSWH (tire section height), inches  = %7.2f\n', tireSWH);
fprintf('wheelDia, inches                       = %7.2f\n', wheelDia);
fprintf('disPeCrev, inches                      = %7.2f\n', disPeCrev);
fprintf('revPerMile_wotif, revolutions          = %7.2f\n', revPerMile_wotif);
fprintf('revPerMile, revolutions                = %7.2f\n', revPerMile);
fprintf('Cttmf                                  = %7.2f\n', Cttmf);

%Displying the dyanamic equations
fprintf('B4: DYNAMIC EQUATIONS:\n');
fprintf('tireSWH = tireWidth * (tireAR/100) / (10 * 2.54);\n');
fprintf('tireWidth is also known as tire-section-width\n');
fprintf('section-width wheelDia = 2 * tireSWH + rimDia;\n');
fprintf('disPeCrev = 3.14 * wheelDia;\n');
fprintf('revPerMile_wotif = (1760 * 3 * 12) / disPeCrev;\n');
fprintf('revPerMile = revPerMile_wotif / Ctif;\n');
fprintf('Cttmf, Tire Torque Constant = 840.34 / revPerMile;\n');
fprintf('AR: Aspect Ratio = Tire_side_wall_ht / Tire_width\n');
fprintf('SWH: Side Wall Height (Section height)\n\n');

fprintf('END COMPUTING BASIC OUPUT PARAMETERS: DP5\n');
