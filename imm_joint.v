//*I, S, B, U, J型指令均具有立即数，但是对输入立即数的操作不同
//*采用拼接器得到所需要的立即数
module imm_joint (
    input [31:0] Instr,
    input [2:0] ExtOp,
    output reg [31:0] imm
);
    wire [31:0] immI;
    wire [31:0] immS;
    wire [31:0] immB;
    wire [31:0] immU;
    wire [31:0] immJ;

    assign immI = {{20{Instr[31]}}, Instr[31:20]};
    assign immU = {Instr[31:12], 12'b0};
    assign immS = {{20{Instr[31]}}, Instr[31:25], Instr[11:7]};
    assign immB = {{20{Instr[31]}}, Instr[7], Instr[30:25], Instr[11:8], 1'b0};
    assign immJ = {{12{Instr[31]}}, Instr[19:12], Instr[20], Instr[30:21], 1'b0};

    always @(*) begin
        case (ExtOp)
            3'b000 : 
                begin
                    imm = immI;
                end
            3'b001 : 
                begin
                    imm = immU;
                end
            3'b010 : 
                begin
                    imm = immS;
                end
            3'b011 :
                begin
                    imm = immB;
                end
            3'b100 : 
                begin
                    imm = immJ;
                end
            default :
                begin
                    imm = 32'bx;
                end
        endcase
    end

endmodule