`timescale 1ns / 1ps

module memory #(
  parameter NUM_SETS    = 8,
  parameter NUM_WAYS    = 4,
  parameter BLOCK_WORDS = 4,
  parameter WORD_SIZE   = 32
)(
  input logic clk, reset,
  input logic readEnable,
  input logic [31:0] readAddress,
  output logic [WORD_SIZE-1:0] instruction,
  output logic ready,
  output logic busy
);

  logic [31:0] DataIn;
  logic DataReady;
  logic [31:0] ReadAddress;
  logic ReadRequest;

  cache c (
    .*,
    .memDataIn      (DataIn),
    .memDataReady   (DataReady),
    .memReadAddress (ReadAddress),
    .memReadRequest (ReadRequest)
  );

  ucsbece154_imem i (.*);

endmodule
