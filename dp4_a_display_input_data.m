%Displaying Input Data: PART A
fprintf('Displaying Input Data: PART A\n');
fprintf('A: INPUT DATA: in1_vehicle\n');

% Vehicle Information
fprintf('A1. Vehicle Information\n');
fprintf('Cd   = drag coefficient 0.25-0.45  :%7.2f\n',Cd);
fprintf('A    = frontArea 15-25, sqft       :%7.2f\n',A);
fprintf('Wvcw = Veh Curb wt 1800-4500, lbs  :%7.2f\n',Wvcw);
fprintf('Nd   = driveTrainEff 0.89-0.91     :%7.2f\n',Nd);
fprintf('g1   = gear ratio 1 8-10           :%7.2f\n',g1);
fprintf('g2   = gear ratio 1 6-8            :%7.2f\n',g2);
fprintf('g3   = gear ratio 1 4-6            :%7.2f\n',g3);
fprintf('g4   = gear ratio 1 2-4            :%7.2f\n',g4);
fprintf('g5   = gear ratio 1 1-2            :%7.2f\n\n',g5);

% Tire Size Width/AR-RimDia
fprintf('A2. Tire Size Width/AR-RimDia\n');
fprintf('tireWidth  = tire width, mm                :%7.2f\n',tireWidth);
fprintf('tireAR     = Tire AR = (h/w)*100, percent  :%7.2f\n',tireAR);
fprintf('rimDia     = Rim Diameter, inches          :%7.2f\n\n',rimDia);

% Input Data : Eletrical Element
% Motor
fprintf('B. INPUT DATA: in2_electricalElements\n');
fprintf('B1. Electrical Component - Motor\n');
fprintf('motorMaxVolts = motor Max Volts, volts :%8.2f\n',motorMaxVolts);
fprintf('Wmot          = Motor weight in lbs    :%8.2f\n',Wmot);
fprintf('motorHP       = Motor power, hp        :%8.2f\n',motorHP);
fprintf('motorMaxRpm   = Motor maximum rpm      :%8.2f\n',motorMaxRpm);
fprintf('motorA        = Motor constant A       :%8.2f\n',motorA);
fprintf('motorB        = Motor constant B       :%8.2f\n',motorB);
fprintf('motorC        = Motor constant C       :%8.2f\n',motorC);
fprintf('motorD        = Motor constant D       :%8.2f\n',motorD);
fprintf('motorK        = Motor constant K       :%8.2f\n',motorK);
fprintf('motorN        = Motor constant N       :%8.2f\n',motorN);
fprintf('motorEff      = Motor efficiency       :%8.2f\n\n',motorEff);

% Battery Pack
fprintf('B2. Electrical Component - Battery pack \n');
fprintf('batteryVolts       = battery voltage, volts                :%7.2f\n',batteryVolts);
fprintf('Wb                 = battery weight                        :%7.2f\n',Wb);
fprintf('peukertAmps        = battery peukert                       :%7.2f\n',peukertAmps);
fprintf('batteryMaxAmps     = battery maximum current               :%7.2f\n',batteryMaxAmps);
fprintf('batteryOhms        = battery dc-resistance, milli-ohms     :%7.2f\n',batteryOhms);
fprintf('batteryAmpHrs      = battery amp-hours                     :%7.2f\n',batteryAmpHrs);
fprintf('numBatStrings      = number of battery strings             :%7.2f\n',numBatStrings);
fprintf('Note: Battery refers to individual\n');
fprintf('      Battery-cell refers to the module\n\n');

% Controller
fprintf('B3. Electrical Component - Controller\n');
fprintf('controllerMinVolts = ctrl min voltage, volts :%7.2f\n',controllerMinVolts);
fprintf('controllerMaxVolts = ctrl max voltage, volts :%7.2f\n',controllerMaxVolts);
fprintf('controllerMaxAmps  = ctrl max current, amps  :%7.2f\n\n',controllerMaxAmps);

% The Charger
fprintf('B4. Electrical Component - Charger\n');
fprintf('chargerMinVolts = charger min voltge, volts :%7.2f\n',chargerMinVolts);
fprintf('chargerMaxVolts = charger min voltge, volts :%7.2f\n',chargerMaxVolts);
fprintf('chargerMaxAmps  = charger max amps, amps    :%7.2f\n',chargerMaxAmps);
fprintf('Wch             = charger weight, lbs       :%7.2f\n\n',Wch);

% Input Data : Enviromental Condition
fprintf('C: INPUT DATA: in3_enviromental\n');
fprintf('C1. Environmental Conditions\n');
fprintf('h      = Percentage of Hill climb, percent     :%7.2f\n',h);
fprintf('Uw     = head wind speed, mph                  :%7.2f\n',Uw);
fprintf('Crw    = Vehicle relative wind factor 0.20-0.26:%7.2f\n',Crw);
fprintf('Ctif   = Tire inflation factor                 :%7.2f\n',Ctif);
fprintf('Ecc    = Vehicle average energy cosumption\n');
fprintf('         Constant, wh/mile/lb                  :%7.2f\n\n',Ecc);
fprintf('END OF INPUT DATA DISPLAY\n\n');