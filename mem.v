//*数据存储器
module mem (
    input [31:0] Addr,
    input WrEn,
    input Clk,
    input DataIn,
    output reg [31:0] Memout
);
    reg [31:0] mem [255:0]; //*设定1KB的内存
    always @ (posedge Clk) begin
        if (WrEn) begin
            mem[Addr] <= DataIn;
        end
        else begin
            Memout <= mem[Addr];
        end
    end
endmodule