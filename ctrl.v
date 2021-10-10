//*控制器设计，根据指令操作码op和功能码funct3，来输出控制信号
module ctrl (
    input [9:0] Instr,
    output wire RegWr,
    output wire ALUASrc,
    output wire [1:0] ALUBSrc,
    output wire [3:0] ALUctr,
    output wire Jump,
    output wire Branch,
    output wire MemtoReg,
    output wire [2:0] ExtOp
);
    reg [13:0] ctrl_sig;

    always @ (*) begin
        case (Instr)


        endcase
    end

    assign RegWr = ctrl_sig[13];
    assign ALUASrc = ctrl_sig[12];
    assign ALUBSrc = ctrl_sig[11:10];
    assign ALUctr = ctrl_sig[9:6];
    assign Jump = ctrl_sig[5];
    assign Branch = ctrl_sig[4];
    assign MemtoReg = ctrl_sig[3];
    assign ExtOp = ctrl_sig[2:0];

endmodule