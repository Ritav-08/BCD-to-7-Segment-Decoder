`timescale 1ns / 1ps

module tb_BCDt7Sdecoder();
reg [3:0]a_i;
wire [6:0]y_o;

//net(s)
reg [6:0]exp_result; //expected output
integer i; //for loop in input feeding

//instantiation
BCDt7Sdecoder DUT(.a_i(a_i), 
   .y_o(y_o));

initial begin //feeding inputs
a_i = 4'b0000; //0
#2 if(y_o !== exp_result) //self checking
      $display("Error | Time: %0t | BCD: %b (%d) | Expected: %b,  Coded: %b", $time, a_i, a_i, exp_result, y_o);
for(i = 1; i < 16; i = i + 1) begin //1-15
   #3 a_i = i;
   #2 if(y_o !== exp_result) //self checking
         $display("Error | Time: %0t | BCD: %b (%d) | Expected: %b,  Coded: %b", $time, a_i, a_i, exp_result, y_o);
end
#5 $finish;
end

//expected results -- for self checking
always@(*)
case (a_i)
4'b0000: exp_result = 7'b1111110; //0
4'b0001: exp_result = 7'b0110000; //1
4'b0010: exp_result = 7'b1101101; //2
4'b0011: exp_result = 7'b1111001; //3
4'b0100: exp_result = 7'b0110011; //4
4'b0101: exp_result = 7'b1011011; //5
4'b0110: exp_result = 7'b1011111; //6
4'b0111: exp_result = 7'b1110000; //7
4'b1000: exp_result = 7'b1111111; //8
4'b1001: exp_result = 7'b1111011; //9
default: exp_result = 7'b0000000; //all off
endcase

initial begin //capture
//$monitor("Time: %0t | BCD: %b (%0d) | Coded Out: %b", $time, a_i, a_i, y_o); //manual checking
$dumpfile("BCDt7Sdecoder.vcd");
$dumpvars(0, tb_BCDt7Sdecoder);
end

endmodule
