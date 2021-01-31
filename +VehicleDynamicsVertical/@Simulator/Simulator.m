classdef Simulator<handle
    % Simulator Vehicle dynamics simulator
    % The simulator receives a vehicle object that inherits from VehicleSimple, simulates its behavior during a given time span and provides its behavior during time via its properties. Each property is a (timespan, 1) vector in which each value represents that parameter's value in time.
    methods
        % Constructor
        function self = Simulator(vehicle, tspan)
            self.Vehicle    = vehicle;
            self.TSpan      = tspan;
            % Initial conditions
            self.zUS0   = 0;
            self.dzUS0  = 0;
            self.zS0    = 0;
            self.dzS0   = 0;
        end

        function f = getInitialState(self)
            % Transforms properties into a vector so it can be used by the integrator
            f = [self.zUS0 self.dzUS0 self.zS0 self.dzS0];
        end

        function Simulate(self)
            options = odeset('AbsTol',1e-6,'RelTol',1e-6);
            [TOUT, XOUT] = ode45(@(t, estados) self.Vehicle.Model(t, estados,self.TSpan), self.TSpan, self.getInitialState(),options);
            % retrieve states exclusive to the vehicle
            self.zUS    = XOUT(:, 1);
            self.dzUS   = XOUT(:, 2);
            self.zS     = XOUT(:, 3);
            self.dzS    = XOUT(:, 4);

            % TSpan and TOUT contain the same values, but the first is passed in columns, while the second is a vector
            self.TSpan = TOUT;
        end
    end

    properties
        Vehicle % Vehicle model to be used in the simulation
        TSpan   % a vector indicating the intervals in which the simulation steps will be conducted
        zUS0    % Initial Unsprung mass position [m]
        dzUS0 	% Initial Unsprung mass speed [m/s]
        zS0     % Initial Sprung mass position [m]
        dzS0 	% Initial Sprung mass speed [m/s]
        zUS     % Unsprung mass position [m]
        dzUS 	% Unsprung mass speed [m/s]
        zS      % Sprung mass position [m]
        dzS 	% Sprung mass speed [m/s]
    end
end

%% See Also
%
% <../../index.html Home>
%