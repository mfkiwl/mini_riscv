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

    //*内存控制对应信号
    wire MemWr;
    wire Memout;


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

    mem u_mem(
    	.Addr   (Result ),
        .WrEn   (WrEn   ),
        .Clk    (Clk    ),
        .DataIn (busB   ),
        .Memout (Memout )
    );

    pc_next u_pc_next(
    	.Branch (Branch ),
        .Zero   (Result ),
        .imm    (imm    ),
        .pc     (pc     ),
        .pc_out (pc_out )
    );
    
    
    
    assign A = busA;
    assign busB_imm = (ALUBSrc == 1) ? imm : busB;
    assign B = busB_imm;


endmodule