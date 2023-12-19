# PWPFM Signal Generator with Hysteresis

This repository contains MATLAB scripts for generating a Pulse Width Pulse Frequency Modulation (PWPFM) signal with complex hysteresis. The `generatePWPFM` function creates a PWPFM signal from a given control signal, incorporating hysteresis thresholds for realistic control behavior. A test script is also provided to demonstrate the usage of this function.

## Files
- `generatePWPFM.m`: The MATLAB function to generate a PWPFM signal with hysteresis.
- `testPWPFM.m`: A test script that demonstrates the function usage and visualizes the output.

## Function Usage

### generatePWPFM
This function generates a PWPFM signal based on a control signal, taking into account specified hysteresis thresholds. It is useful in simulations where control signals are converted into on/off signals with realistic switching behavior.

#### Syntax
```matlab
pwpfm_signal = generatePWPFM(control_signal, sampling_rate, pw_base, pf_base, on_threshold, off_threshold)
```

#### Parameters
- `control_signal`: The input control signal vector.
- `sampling_rate`: The sampling rate in Hz.
- `pw_base`: Base pulse width in seconds.
- `pf_base`: Base pulse frequency in Hz.
- `on_threshold`: Two-element vector [positive_on_threshold, negative_on_threshold].
- `off_threshold`: Two-element vector [positive_off_threshold, negative_off_threshold].

#### Returns
- `pwpfm_signal`: The generated PWPFM signal.

### Test Script (testPWPFM.m)
The test script `testPWPFM.m` demonstrates how to use the `generatePWPFM` function. It generates a control signal, applies the PWPFM function, and plots both the control and the PWPFM signals for visualization.

## Running the Test
To run the test script, simply execute `testPWPFM.m` in MATLAB. The script will generate a control signal, process it through the `generatePWPFM` function, and plot the results.

## Contributing
Contributions to this project are welcome. Please ensure to update tests as appropriate.

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
