module wallace_tree_reduction(a, b, r1, r2);
	
	input logic [4:0] a, b;
	output logic [9:0] r1, r2;
	
	logic sh1, ch1, sf1, cf1, sf2, cf2, sh2, ch2, sf3, cf3, sf4, cf4;
	HA ha1(b[2]&a[0], b[1]&a[1], sh1, ch1);
	FA f1(b[3]&a[0], b[2]&a[1], b[1]&a[2], sf1, cf1);
	FA f2(b[4]&a[0], b[3]&a[1], b[2]&a[2], sf2, cf2);
	HA ha2(b[1]&a[3], b[0]&a[4], sh2, ch2);
	FA f3(b[4]&a[1], b[3]&a[2], b[2]&a[3], sf3, cf3);
	FA f4(b[4]&a[2], b[3]&a[3], b[2]&a[4], sf4, cf4);
	
	logic sh3, ch3, sf5, cf5, sf6, cf6, sh4, ch4, sf7, cf7;
	HA ha3(ch1, sf1, sh3, ch3);
	FA f5(cf1, sf2, sh2, sf5, cf5);
	FA f6(cf2, ch2, sf3, sf6, cf6);
	HA ha4(cf3, sf4, sh4, ch4);
	FA f7(cf4, b[4]&a[3], b[3]&a[4], sf7, cf7);
	
	logic sh5, ch5, sh6, ch6, sh7, ch7, sh8, ch8;
	HA ha5(cf5, sf6, sh5, ch5);
	HA ha6(cf6, sh4, sh6, ch6);
	HA ha7(ch4, sf7, sh7, ch7);
	HA ha8(cf7, b[4]&a[4], sh8, ch8);
	
	assign r1 = {1'b0, ch7, ch6, ch5, sh5, ch3, sh3, sh1, b[1]&a[0], b[0]&a[0]};
	assign r2 = {ch8, sh8, sh7, sh6, b[1]&a[4], sf5, b[0]&a[3], b[0]&a[2], b[0]&a[1], 1'b0};

endmodule
