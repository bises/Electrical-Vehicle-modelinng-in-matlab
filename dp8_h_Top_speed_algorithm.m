clc;
fprintf('PART H: TOP-SPEED ALGORITHM\n');
fprintf('Acharya Bishesh; Spring 2016; Update %s\n',date());

fprintf('motorMaxRpm = %d    ', motorMaxRpm); fprintf('IbpMax = %d    ',batteryMaxAmps); fprintf('VbpMax = %d    \n',Vbpmax);
counter = 0;

for Gi = G
  counter = counter + 1;
  fprintf('GEAR RESULTS:  %d\n',counter);
  fprintf('Uv mph                        '); fprintf('%6.0f',Uv(10:10:90)); fprintf('\n');

  Tm = Tt/(Gi * Nd);
  Rm = Uv * Gi * revPerMile / 60;
  Im = power(Tm / motorK , 1 / motorN);
  Temp1 = power(Tm,motorB);
  Vm = (Rm * motorD)./((motorA ./ Temp1) + motorC);
  
  %Display of the Motor Parameters
  fprintf('c. requireMotorRpm, rpm       '); fprintf('%6.0f',Rm(10:10:90)); fprintf('\n'); 
  fprintf('d. requiredMotorAmps, amps    '); fprintf('%6.0f',Im(10:10:90)); fprintf('\n');
  fprintf('e. requiredMotorVoltsVm, volts'); fprintf('%6.0f',Vm(10:10:90)); fprintf('\n');
  
  temp = (Rm >= motorMaxRpm);           %makes every element greater than motorMaxRpm = 1 and other 0
  topSpeedRestriction = find(temp);     %find the index of every element that is 1
  if (isempty(topSpeedRestriction))     %to check if there is no limitation 
    topSpeedRestriction(1,end+1) = 91;  
  end
  temp = (Im >= batteryMaxAmps);        %makes every element greater than batteryMaxAmps = 1 and other 0
  ampsSpeedRestriction = find(temp);    %find the index of every element that is 1
  if (isempty(ampsSpeedRestriction))    %to check if there is no limitation
    ampsSpeedRestriction(1,end+1) = 91;
  end
  temp = (Vm >= Vbpmax);
  voltsSpeedRestriction = find(temp);
  if (isempty(voltsSpeedRestriction))
    voltsSpeedRestriction(1,end+1) = 91;
  end
  [value,index] = min([topSpeedRestriction(1),ampsSpeedRestriction(1),voltsSpeedRestriction(1)]);
  if (index == 1)
    fprintf('Limitted by: Motor Max RPM Rmmax;\nTop Speed= %d mph; requireMotorRpm@this speed = %d rpm \n',value-1,Rm(value-1));
  elseif (index == 2)
    fprintf('Limitted by: Batterypack Max Amps IbpMax;\nTop Speed= %d mph; requireMotorAmps@this speed = %d amps \n',value-1,Im(value-1));
  elseif (index == 3)
    fprintf('Limitted by: Batterypack Max Volts VbpMax;\nTop Speed= %d mph; requireMotorVolts@this speed = %d volts \n',value-1,Vm(value-1));
  end 
  fprintf('\n');  
end