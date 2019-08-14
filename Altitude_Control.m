function direction = Altitude_Control(t,Y)

global AuxParam Step_counter orbits time time_init v_previous


%Control method 1 
%Timing control in order to reach altitude increase of 50Km 

% direction = 0;
% if t > 2236
%    AuxParam.Thrust = 0;
% end
% 
% if t > 84164 
%     AuxParam.Thrust = 1;
%     direction = 1;
% end

%Control method 2 
%Semi - major axis control in order to reach increase of 50Km. 
%Elements used: Semi-major axis (sm) , period (T)

[sm, ~, ~, ~, ~, ~ , T] = Orbital_Elem(Y);

 direction = 0; 

if sm > 7005
    AuxParam.Thrust = 0;
    if Step_counter == 0
    time_init = t;
    end
    time = t - time_init;
    if time > T
        orbits = orbits + 1;
        time_init = t;
    end
    if orbits > 4 
        AuxParam.Thrust = 1;
        direction = 1;
    end 
    Step_counter = Step_counter + 1; 
end

%Control method 3 
%Semi - major axis control in order to reach increase of 50Km. 
%Elements used: Semi-major axis (sm) , True Anomaly (TrueA)

% if Step_counter ~= 0
% v_previous = TrueA;
% end
% 
% [sm, ~, ~, ~, ~, TrueA , ~] = Orbital_Elem(Y);
% 
%  direction = 0; 
%  
%  if sm > 7005 
%     AuxParam.Thrust = 0;
%     time_init = t;
%     if Step_counter ~= 0
%     time = t - time_init;
%     end
%  end 
%  
%  v = TrueA ;
%  
%  if v < v_previous && sm > 7005 
%      orbits = orbits + 1; 
%  end 
%  
%  if orbits > 4 
%      AuxParam.Thrust = 1; 
%      direction = 1; 
%  end 
%  

end 
