module baud_gen(
    input clk,
    input reset,
    output reg baud_tick
);

parameter DIV = 2; // 100 MHz ? 9600 baud

reg [13:0] count;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        count <= 0;
        baud_tick <= 0;
    end else begin
        if (count == DIV - 1) begin
            count <= 0;
            baud_tick <= 1;   // one pulse
        end else begin
            count <= count + 1;
            baud_tick <= 0;
        end
    end
end

endmodule
