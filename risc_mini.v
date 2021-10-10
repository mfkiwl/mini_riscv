module risc_mini (
    
);
    //*ALU对应信号，根据A, B的值和ALUctr的指令来进行计算
    wire A;
    wire B;
    wire ALUctr;
    wire Result;
    
    //*扩展器对应信号
    wire [31:0] Instr;
    wire [2:0] ExtOp;
    wire [31:0] imm;

    //*MUX对应信号
    wire ALUASrc;
    wire [1:0] ALUBSrc;
    reg [31:0] MUXa;
    reg [31:0] MUXb;


    //*内存控制对应信号
    wire MemWr;
    wire Memout;

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

    always @ (*) begin
        if (ALUASrc) begin
            MUXa = pc;
        end
        else MUXa = busA;
    end
    assign A = MUXa;

    always @ (*) begin
        case (ALUBSrc)
            2'd0 : MUXb = busB;
            2'd1 : MUXb = 32'd4;
            2'd2 : MUXb = imm;
            default: MUXb = 32'bx;
        endcase
    end
    assign B = MUXb;
endmodule