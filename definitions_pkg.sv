package definitions_pkg;
  parameter IMAGE_WIDTH = 512;

  // The clock rate of the board
  parameter int CLOCK_RATE = 10000000;
  // The baud rate of the UART interface
  parameter int BAUD_RATE = 115200;
  parameter int BAUD_RATE_WIDTH = $clog2(BAUD_RATE);
  // The oversample rate runs the UART receiver faster than baud for stability
  parameter int OVERSAMPLE_RATE = 16;
  // The hold time is how many oversampled baud ticks it takes before the
  // received UART signal is considered stable.
  parameter int HOLD_TIME = 5;

  const logic [7:0] gaussian_kernel_3 [0:8] =  '{
    8'h1, 8'h2, 8'h1, 
    8'h2, 8'h4, 8'h2, 
    8'h1, 8'h2, 8'h1 
  };

  // sobel X kernel
  const logic signed [7:0] sobel_x [0:8] = '{
    8'shff, 8'sh00, 8'sh01,
    8'shfe, 8'sh00, 8'sh02,
    8'shff, 8'sh00, 8'sh01
  };

  // sobel Y kernel
  const logic signed [7:0] sobel_y [0:8] = '{
    8'shff, 8'shfe, 8'shff,
    8'sh00, 8'sh00, 8'sh00,
    8'sh01, 8'sh02, 8'sh01
  };

endpackage: definitions_pkg
