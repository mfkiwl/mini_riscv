module risc_mini (
    
);
    //*ALU对应信号
    wire A;
    wire B;
    wire Result;
    wire ALUctr;

    //*扩展器对应信号
    wire [31:0] Instr;
    wire [2:0] ExtOp;
    wire [31:0] imm;

    wire busB_imm;
    wire ALUBSrc;

    reg_32 u_reg_32(
    	.Rw    (Rw    ),
        .Ra    (Ra    ),
        .Rb    (Rb    ),
        .RegWr (RegWr ),
        .busW  (busW  ),
        .Clk   (Clk   ),
        .busA  (busA  ),
        .busB  (busB  )
    );
    
    imm_joint u_imm_joint(
    	.Instr (Instr ),
        .ExtOp (ExtOp ),
        .imm   (imm   )
    );

    alu u_alu(
    	.A      (A      ),
        .B      (B      ),
        .ALUctr (ALUctr ),
        .result (result ),
        .result (result )
    );
    
    assign A = busA;
    assign busB_imm = (ALUBSrc == 1) ? imm : busB;
    assign B = busB_imm;
endmodule