
module seq_det_tb;

reg seq_in,clk,rst;
wire det_o;

   
   
seq_det sed(.clk(clk),.rst(rst),.seq_in(seq_in),.det_o(det_o));

always begin 
   #5  clk=~clk;
end
initial begin

clk=0;
rst=1;
seq_in=0;

#10 rst=0;

repeat (100) begin
            seq_in = $random % 2;
            #10;
            end
 #10  seq_in=1;
 #10  seq_in=0;
 #10  seq_in=1;
 #10  seq_in=1;
 #10  seq_in=0;

 #20  seq_in=1;
 #10  seq_in=1;
 #10  seq_in=0;
 #10  seq_in=1;
 #10  seq_in=1;
 #10  seq_in=0;
 # 20  $finish;
end
endmodule



