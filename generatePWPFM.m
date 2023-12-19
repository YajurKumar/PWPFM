function pwpfm_signal = generatePWPFM(control_signal, sampling_rate, pw_base, pf_base, on_threshold, off_threshold)
    % generatePWPFM Generates a PWPFM signal with complex hysteresis from a control signal.
    % Created by Yajur Kumar, 2023. More: https://github.com/YajurKumar
    % Inputs:
    %   control_signal - Control signal vector.
    %   sampling_rate - Sampling rate in Hz.
    %   pw_base - Base pulse width in seconds.
    %   pf_base - Base pulse frequency in Hz.
    %   on_threshold - Thresholds for turning the signal 'on' [positive_threshold, negative_threshold].
    %   off_threshold - Thresholds for turning the signal 'off' [positive_threshold, negative_threshold].
    %
    % Output:
    %   pwpfm_signal - Generated PWPFM signal.

    % Validate inputs
    if nargin < 6
        error('Insufficient number of input arguments.');
    end
    if ~isvector(control_signal)
        error('Control signal must be a vector.');
    end
    if sampling_rate <= 0
        error('Sampling rate must be positive.');
    end

    % Time vector
    dt = 1 / sampling_rate;
    t = 0:dt:dt*(length(control_signal)-1);

    % Initialize PWPFM signal and state
    pwpfm_signal = zeros(size(t));
    signal_state = 0; % 0: off, 1: on

    % Pulse parameters
    current_time = 0;
    i = 1;

    while current_time < t(end)
        % Hysteresis logic
        if signal_state == 0
            if control_signal(i) > on_threshold(1)
                signal_state = 1; % Turn on for positive signal
            elseif control_signal(i) < on_threshold(2)
                signal_state = -1; % Turn on for negative signal
            end
        else
            if (signal_state == 1 && control_signal(i) < off_threshold(1)) || (signal_state == -1 && control_signal(i) > off_threshold(2))
                signal_state = 0; % Turn off
            end
        end

        % Adjusting pulse width and frequency based on absolute value of control signal
        pw = pw_base * (1 + abs(control_signal(i)));
        pf = pf_base * (1 + abs(control_signal(i)));

        % Pulse time span
        pulse_end_time = current_time + pw;
        next_pulse_start = current_time + 1/pf;

        % Generate pulse
        while i <= length(t) && t(i) <= pulse_end_time
            pwpfm_signal(i) = signal_state;
            i = i + 1;
        end

        % Skip to the start of the next pulse
        while i <= length(t) && t(i) < next_pulse_start
            i = i + 1;
        end

        current_time = next_pulse_start;
    end
end
