classdef (Abstract) VehicleModel
    % VehicleModel vehicle abstract class.
    %
    % Abstract class representing a vehicle.
    %
    % Extend this class in order to create a new vehicle model to be used with the simulator.

    methods(Abstract)
        Model(self, t, estados)
    end

    properties
        M  % Sprung Mass               [kg]
        m  % Unsprung Mass             [kg]
        Kt % Stiffness tire            [N/m]
        Ks % Stiffness suspension      [N]
        Cs % Damping suspension        [Ns/m]
    end

    methods

    end

end

%% See Also
%
% <../../index.html Home>
%
