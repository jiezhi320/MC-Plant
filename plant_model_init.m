% For more details about this multicopter plant model, please refer to:
% https://pure.tue.nl/ws/portalfiles/portal/110035542/Jiachi_Zou_Thesis.pdf

model_version = 'v0.2.2';
model_name = 'Multicopter';

%% load configuration
load('plant_default_config.mat');

%% Constant Variable (for internal use)
PLANT_CONST.dt = 0.002;

%% init plant model parameter
plant_model.mass = 0.25;      % 0.886 kg
plant_model.Jxx = 3.867*1e-4; % 0.016;	% moment of inertia in body x axis
plant_model.Jyy = 4.418*1e-4; %0.016;	% moment of inertia in body y axis
plant_model.Jzz = 7.725*1e-4; %0.0274;	% moment of inertia in body z axis

plant_model.Cm = 1.982e-07;	% Rotor torque coefficient(kg.m^2)
plant_model.Ct = 1.16*1e-5; %1.239e-05;	%%% Rotor thrust coefficient(kg.m^2)
plant_model.R = 0.11; % 0.225; % Body radius(m)

plant_model.motorCr = 718.078; %Motor throttle-speed curve slope(rad/s)
plant_model.motorWb = 88.448;  %Motor speed-throttle curve constant term(rad/s)
plant_model.motorT = 0.04;  % 0.02 Motor inertia time constant(s)
plant_model.motorJm = 0.0001287;    %Moment of inertia of motor rotor + propeller(kg.m^2)

%% Exported Value
PLANT_EXPORT_VALUE.period = uint32(PLANT_CONST.dt*1e3); 
PLANT_EXPORT_VALUE.model_info = int8([model_name, ' ', model_version, 0]); % 0 for end of string

PLANT_EXPORT = Simulink.Parameter(PLANT_EXPORT_VALUE);
PLANT_EXPORT.CoderInfo.StorageClass = 'ExportedGlobal';

%% init sensor model
run('sensor_model_init.m');
