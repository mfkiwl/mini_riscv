//*下地址逻辑
module pc_next (
    input Branch,
    input Zero,
    input Jump,
    input [31:0] imm,
    input [31:0] pc,
    output reg [31:0] pc_out
);
    always @ (*) begin
        if (Jump || (Branch && Zero)) begin
            pc_out = pc + imm;
        end
        else begin
            pc_out = pc + 4;
        end
    end
endmodule