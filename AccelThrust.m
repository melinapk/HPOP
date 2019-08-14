function a = AccelThrust(Y,mass,d)

%Calculation of DCM for LVLH conversion.

QXx = LVLHTransformation(Y);

%Thrust force magnitude in N
%The force is applied in Y axis of LVLH frame, axis similar to velocity.

if d == 1 
    Thrustlvlh = [ 0 , -1 , 0];
else
    Thrustlvlh = [ 0 , 1 , 0];
end

%Transformation of Thrust vector to ECI

Thrusteci = inv(QXx) * Thrustlvlh';

% Acceleration
a = 1/mass*Thrusteci;