classdef VehicleModel2DOF < VehicleDynamicsVertical.VehicleModel
    % VehicleModel2DOF quarter vehicle model with 2 DOF.
    %
    % It inherits properties from VehicleModel.

    methods
        % Constructor
        function self = VehicleModel2DOF()
            self.M  = 1000;         % Sprung Mass               [kg]
            self.m  = 100;          % Unsprung Mass             [kg]
            self.Kt = 480000;       % Stiffness tire            [N/m]
            self.Ks = 48000;        % Stiffness suspension      [N]
            self.Cs = 4000;         % Damping suspension        [Ns/m]
        end

        function dx = Model(self, t, states,~)
            
            % Parameters
            M   = self.M;
            m   = self.m;
            Kt  = self.Kt;
            Ks  = self.Ks;
            Cs  = self.Cs;
           
            % States
            x = states;

            % Input
            u = 0;
            if t>1
                u = 0.1;
            end
            
            % State matrices
            A = [0              1       0       0       ;
                 -(Ks + Kt)/m   -Cs/m   Ks/m    Cs/m    ;
                 0              0       0       1       ;
                 Ks/M           Cs/M    -Ks/M   -Cs/M   ];
            B = [0      ;
                 Kt/m   ;
                 0      ;
                 0      ];
%             C=[1 0 0 0;
%                0 0 1 0];
%             D=[0 ; 0];

            % Dynamics
            dx = A*x + B*u;

        end
    end
end

%% See Also
%
% <../../index.html Home>
%
