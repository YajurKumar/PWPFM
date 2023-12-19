clear; close all; clc;

% Test Script for the generatePWPFM Function with Hysteresis

% Simulation Parameters
sampling_rate = 100; % Hz
simulation_duration = 20; % seconds
pw_base = 0.1; % seconds (base pulse width)
pf_base = 2; % Hz (base pulse frequency)

% Hysteresis Thresholds
% [positive on-threshold, negative on-threshold]
on_threshold = [0.3, -0.3]; 
% [positive off-threshold, negative off-threshold]
off_threshold = [0.1, -0.1];

% Generating a control signal
% Example: A sine wave with varying amplitude
time_vector = linspace(0, simulation_duration, sampling_rate * simulation_duration);
control_signal = 0.5 * sin(2 * pi * 0.1 * time_vector);

% Generating the PWPFM signal with hysteresis
pwpfm_signal = generatePWPFM(control_signal, sampling_rate, pw_base, pf_base, on_threshold, off_threshold);

% Plotting the results
figure;

% Plotting Control Signal
subplot(2,1,1);
plot(time_vector, control_signal);
title('Control Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plotting PWPFM Signal
subplot(2,1,2);
plot(time_vector, pwpfm_signal);
title('PWPFM Signal with Hysteresis');
xlabel('Time (s)');
ylabel('State');
grid on;
