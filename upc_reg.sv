// micro-program counter, asynchronous reset
// Active high load
// Active low increment
module upcreg(
  input              clk,
  input              reset,
  input              load_incr,
  input [4:0]        upc_next,
  output logic [4:0] upc);

  always_ff @ (posedge clk, posedge reset) begin
// fill in guts
//   if(...) upc <= ...; else if(...) upc <= ...; else ... 
//   reset    load_incr	    upc
//     1		       1			   0
//	   1		       0         0
//	   0		       1		  upc_next
//	   0	         0        upc+1
    // if(reset == 1)
    //   upc <= 0;
    // else if(reset == 0)
    //   if(load_incr == 1)
    //     upc <= upc_next;
    //   else if(load_incr == 0)
    //     upc <= upc + 1;
    if (reset)
      upc <= 5'b00000;
    else if (load_incr)
      upc <= upc_next;
    else if (load_incr == 0)
      upc <= upc + 1;
    else
      upc <= 5'b00000; // edge case, should not happen
  end
endmodule    