//*cpu内部的32个寄存器
module reg_32 (
    input [4:0] Rw,
    input [4:0] Ra,
    input [4:0] Rb,
    input RegWr,
    input [31:0] busW,
    input Clk,
    output wire [31:0] busA,
    output wire [31:0] busB
);
    reg [31:0] reg_32 [31:0];
    assign busA = reg_32[Ra];
    assign busB = reg_32[Rb];

    always @ (posedge Clk) begin
        if (RegWr) begin
            reg_32[Rw] <= busW;
        end
    end
endmodule