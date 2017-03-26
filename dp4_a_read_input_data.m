%% Electrical Vehicle Modeling 
% This script models
% Reading input data into Matlab Workspace: 
clc;

%% INPUT DATA 1: inl_vehicle
%%% Al. Vehicle Information
% vehicleModelName: fwd aerodynamic small car-2
Cd              = 0.32;      % dragCoeffcient 0.25-0.45
A               = 25.0;      % frontArea, sq-ft 17-25
Wvcw            = 2500.0;    % vehicle curbWeight, lbs 2000-4500
Nd              = 0.92;      % driveTrainEfficiency
g1              = 8.0;       % gl
g2              = 6.0;       % g2
g3              = 4.0;       % g3
g4              = 3.0;       % g4
g5              = 2.0;       % g5
%* A2. Tire size 195/60-R14
tireWidth       = 185;       % tire width, mm
tireAR          = 75;        % tire aspect ratio=(swh/width)*100
rimDia          = 14;        % rimDia -- Rim diameter, inches
%* A3. Misc Information
Crr             = 0.020;     % Crr, rolling resistance
Cbas            = 0.005;     % Cbas, breaking and steering
Wr              = 600;       % weight removed, lbs: engine+ehaust..
Wmisc           = 300;       % Wmisc, misc weight Added, lbs

%% INPUT DATA 2: in2_electricElements
%%% Bl. Electric Components - Motor:
% motorModelName: ADC-XP1227: 28-120-8-15.5 
motorMaxVolts   = 144.0;              % motorMaxVolts;
Wmot            = 120.0;              % Wmot
motorHP         = 28.0;               % motor power HP
motorMaxRpm     = 5500.0;             % motor Max Rpm
motorA          = 21163.0;            % motor constant A
motorB          = 0.19;               % motorconstant B
motorC          = -4664;              % motor constant C
motorD          = 192;                % motor constant D
motorK          = 0.0282;             % motor constant K
motorN          = 1.37;               % motor constant N
motorEff        = 0.94;               % motorEff
%* B2. Electric Components - Battery 
% batteryModelName: Trojan T-105
batteryVolts    = 6.0;      % batteryVolts
Wb              = 25.0;     % indivisual battery wt
peukertExp      = 1.25;     % peukertExp
peukertAmps     = 200.0;	  % peukertAmps
batteryMaxAmps	= 250.0;	  % batteryMaxAmps
batteryOhms     = 0.005;	  % batteryOhms
batteryAmpHrs	= 240.00;	    % batteryAmpHrs
numBatPerString = 25;       % numPerString
numBatStrings	= 1;          % num0fStrings
%* B3. Electric Components - Controller
% controllerModelName: Curtis 1231C-7701 
controllerMinVolts = 72;    % controllerMinVolts 
controllerMaxVolts = 120;   % controllerMaxVolts 
controllerMaxAmps  = 550;   % controllerMaxAmps
Wc                 = 50;    % Wc controllerWeight
Nc                 = 0.95;  % Nc controllerEff
%* B4. Electric Components - Charger
% chargerModelName: Zivan
chargerMinVolts    = 72;	% chargerMinVolts
chargerMaxVolts    = 144;	% chargerMaxVolts
chargerMaxAmps     = 50;	% chargerMaxAmps
Wch                = 50;	% Wch chargerWeight Wch

%% INPUT DATA 3: in3_environmental 
% Environmental Conditions:
h                  = 12;	% h, Percentage of hill-climb
Uw                 = 15;	% Uw, windSpeed, mph
Crw                = 1.3;	%Crw, Relative wind factor
Ctif               = 0.80;  % Ctif, Tire inflation factor
Ecc                = 0.10;  % vehicle energy consumption constant
                            % wh mile-1 lb-1
