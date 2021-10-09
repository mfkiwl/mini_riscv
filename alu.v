//*实现九条目标指令的运算控制器
//*暂时采用高层次描述，后期若有需要则用手工模块替代
module alu (
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUctr,
    output reg [31:0] result,
    output reg result
);
    reg SUBctr; //*加法控制器，为1时做减法，为0时做加法
    reg [1:0] OPctr; //*用来控制哪种运算的结果作为result输出
    reg SIGctr; //*数值比较时使用有符号整数还是无符号整数，1为有符号，0为无符号\

    always @(ALUctr) begin
        case (ALUctr)
            4'b0000 : //*加法操作
                begin
                    SUBctr = 0;
                    SIGctr = x;
                    OPctr = 2'b00;
                end
            4'b0010 : //*有符号整数比较，小于与则置1
                begin
                    SUBctr = 1;
                    SIGctr = 1;
                    OPctr = 2'b11;
                end
            4'b0011 : //*无符号整数比较，小于与则置1
                begin
                    SUBctr = 1;
                    SIGctr = 0;
                    OPctr = 2'b11;
                end
            4'b0110 : //*按位或
                begin
                    SUBctr = x;
                    SIGctr = x;
                    OPctr = 2'b01;
                end
            4'b1000 : //*减法操作
                begin
                    SUBctr = 1;
                    SIGctr = x;
                    OPctr = 2'b00;
                end
            4'b1111 : //*操作数直接输出
                begin
                    SUBctr = x;
                    SIGctr = x;
                    OPctr = 2'b10;
                end
            default : 
                begin
                    SUBctr = x;
                    SIGctr = x;
                    OPctr = 2'bxx;
                end
        endcase
    end
endmodule