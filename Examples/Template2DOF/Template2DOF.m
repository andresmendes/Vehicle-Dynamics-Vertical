%% Template 2DOF
% This template shows how to simulate a quarter car model and plot the
% results.
%
%% Simulation models and parameters
% First, all classes of the package are imported with

clear ; close all ; clc

import VehicleDynamicsVertical.*

%%
% Choosing vehicle model.

% Choosing vehicle
VehicleModel = VehicleModel2DOF();

%%
% Choosing simulation time span

T       = 4;                        % Total simulation time         [s]
resol   = 500;                      % Resolution
TSPAN   = 0:T/resol:T;              % Time span                     [s]

%%
% To define a simulation object (simulator) the arguments must be the
% vehicle object and the time span.

simulator = Simulator(VehicleModel, TSPAN);

%% Run simulation
% To simulate the system we run the Simulate method of the simulation
% object.

simulator.Simulate();

%% Results
% The time series of each state is stored in separate variables. Retrieving
% states

zUS     = simulator.zUS;
dzUS    = simulator.dzUS;
zS      = simulator.zS;
dzS     = simulator.dzS;

%%
% Plotting the states

figure
hold on ; grid on ; box on
plot(TSPAN,zUS)
plot(TSPAN,zS)
xlabel('Time [s]')
ylabel('Position [m]')
legend('zUS','zS')

figure
hold on ; grid on ; box on
plot(TSPAN,dzUS)
plot(TSPAN,dzS)
xlabel('Time [s]')
ylabel('Speed [m/s]')
legend('dzUS','dzS')

%% See Also
%
% <../../../index.html Home>
%
