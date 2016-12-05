// based off https://github.com/pyca/bcrypt/blob/master/src/_csrc/blf.c#L530

module EncryptECB(
    input enable,
    input [183:0] ctext,
    inout [8:0] data [63:0]  // data is an array of 8-bit numbers in chunks of 8
    );

reg[31:0] l, r, i;
reg[31:0] d [1:0];

reg[31:0] c;  // the current chunk of 8 in data being addressed
    
always @(posedge enable) begin
    c = 0;
    for (i = 0; i < 8; i++) begin  // loop over each chunk
        l = data[c + 0] << 24 | data[c + 1] << 16 | data[c + 2] << 8 | data[3];
        r = data[c + 4] << 24 | data[c + 5] << 16 | data[c + 6] << 8 | data[7];
        d[0] = l;
        d[1] = r;
        Encrypt(ctext, d);
        l = d[0];
        r = d[1];
        data[c + 0] = l >> 24 & 0xff;
        data[c + 1] = l >> 16 & 0xff;
        data[c + 2] = l >> 8  & 0xff;
        data[c + 3] = l       & 0xff;
        data[c + 4] = r >> 24 & 0xff;
        data[c + 5] = r >> 16 & 0xff;
        data[c + 6] = r >> 8  & 0xff;
        data[c + 7] = r       & 0xff;
        c = c + 8;
    end
end


endmodule