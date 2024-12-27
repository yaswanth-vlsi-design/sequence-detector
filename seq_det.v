module seq_det#(parameter IDLE   = 3'b000,STATE1 = 3'b001, STATE2 = 3'b010, STATE3 = 3'b011, STATE4 = 3'b100)(seq_in,
	       clk,
	       rst,
	       det_o);
								 
      
   input seq_in,clk,rst;
   output det_o;

      reg [2:0]state,next_state;

   
   always@(posedge clk,posedge rst)
      begin
	 if(rst)
	    state <= IDLE;
	 else
	    state <= next_state;
      end
			
      always@(state,seq_in)
      begin
	 case(state)
	    IDLE   : 
                      if(seq_in==1) 
		         next_state=STATE1;
	              else
	                 next_state=IDLE;
	    STATE1 : 
                      if(seq_in==0)
	                 next_state=STATE2;
	              else
	                 next_state=STATE1;
	    STATE2 :
                      if(seq_in==1)
	                 next_state=STATE3;
	              else 
	                 next_state=IDLE;
	    STATE3 : 
                      if(seq_in==1)
	                 next_state=STATE4;
	              else 
	                 next_state=STATE2;
	    STATE4 :
                      if(seq_in==1)
	                 next_state=STATE1;
	              else 
	                 next_state=IDLE;
	    default: 
                      next_state=IDLE;
	 endcase
      end

     assign det_o = (state ==  STATE4) ? 1'b1:1'b0;

endmodule

