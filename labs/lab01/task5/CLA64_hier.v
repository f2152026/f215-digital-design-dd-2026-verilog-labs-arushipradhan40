// cla64_hier.v
// BONUS -- open-ended. No detailed scaffold is provided; this is meant to
// be a genuine design exercise. Not required for lab submission.
//
// You will likely need to modify cla4.v (or add signals alongside it) so
// that block-generate/block-propagate summaries of its own Gi, Pi signals
// are exposed as outputs, since the second-level lookahead unit below
// needs them. As with every module in this lab from Task 2 onward, every
// gate/assign you add should carry an explicit delay.
//
// Starting point (from Tutorial 3, Q4(d)):
//   - Reuse 16 four-bit CLA blocks (your cla4.v) -- their internal logic
//     doesn't change.
//   - For each block k, define:
//       Gblk_k = "this block produces a carry regardless of its incoming
//                 carry" -- a Boolean function of that block's own 4
//                 bit-level Gi, Pi signals.
//       Pblk_k = "an incoming carry sails straight through this whole
//                 block" -- likewise a function of its own Gi, Pi.
//   - Build a second-level lookahead unit -- structurally identical to
//     cla4.v, just one level up -- that computes each block's carry-in
//     directly from Gblk_0..Gblk_15, Pblk_0..Pblk_15, and cin, instead of
//     rippling block to block.
//
// To test this, wire it into dut.v as a fourth option (copy the pattern
// used for the other three) and run it through the same tb.v. Compare
// your final delay to cla64_blocked.v from Task 4.

module cla64_hier(
  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout
);

  // TODO: your hierarchical design goes here.

   // --------------------------------------------------
  // 16 four-bit CLA blocks
  // --------------------------------------------------

  wire [15:0] Pblk;
  wire [15:0] Gblk;

  // Carry into each 4-bit block
  wire [16:0] cblk;

  assign #(2) cblk[0] = cin;

  // --------------------------------------------------
  // Instantiate the 16 CLA blocks
  // --------------------------------------------------

  cla4 block0 (
    .a(a[3:0]),
    .b(b[3:0]),
    .cin(cblk[0]),
    .sum(sum[3:0]),
    .cout(),
    .Pblk(Pblk[0]),
    .Gblk(Gblk[0])
  );

  cla4 block1 (
    .a(a[7:4]),
    .b(b[7:4]),
    .cin(cblk[1]),
    .sum(sum[7:4]),
    .cout(),
    .Pblk(Pblk[1]),
    .Gblk(Gblk[1])
  );

  cla4 block2 (
    .a(a[11:8]),
    .b(b[11:8]),
    .cin(cblk[2]),
    .sum(sum[11:8]),
    .cout(),
    .Pblk(Pblk[2]),
    .Gblk(Gblk[2])
  );

  cla4 block3 (
    .a(a[15:12]),
    .b(b[15:12]),
    .cin(cblk[3]),
    .sum(sum[15:12]),
    .cout(),
    .Pblk(Pblk[3]),
    .Gblk(Gblk[3])
  );

  cla4 block4 (
    .a(a[19:16]),
    .b(b[19:16]),
    .cin(cblk[4]),
    .sum(sum[19:16]),
    .cout(),
    .Pblk(Pblk[4]),
    .Gblk(Gblk[4])
  );

  cla4 block5 (
    .a(a[23:20]),
    .b(b[23:20]),
    .cin(cblk[5]),
    .sum(sum[23:20]),
    .cout(),
    .Pblk(Pblk[5]),
    .Gblk(Gblk[5])
  );

  cla4 block6 (
    .a(a[27:24]),
    .b(b[27:24]),
    .cin(cblk[6]),
    .sum(sum[27:24]),
    .cout(),
    .Pblk(Pblk[6]),
    .Gblk(Gblk[6])
  );

  cla4 block7 (
    .a(a[31:28]),
    .b(b[31:28]),
    .cin(cblk[7]),
    .sum(sum[31:28]),
    .cout(),
    .Pblk(Pblk[7]),
    .Gblk(Gblk[7])
  );

  cla4 block8 (
    .a(a[35:32]),
    .b(b[35:32]),
    .cin(cblk[8]),
    .sum(sum[35:32]),
    .cout(),
    .Pblk(Pblk[8]),
    .Gblk(Gblk[8])
  );

  cla4 block9 (
    .a(a[39:36]),
    .b(b[39:36]),
    .cin(cblk[9]),
    .sum(sum[39:36]),
    .cout(),
    .Pblk(Pblk[9]),
    .Gblk(Gblk[9])
  );

  cla4 block10 (
    .a(a[43:40]),
    .b(b[43:40]),
    .cin(cblk[10]),
    .sum(sum[43:40]),
    .cout(),
    .Pblk(Pblk[10]),
    .Gblk(Gblk[10])
  );

  cla4 block11 (
    .a(a[47:44]),
    .b(b[47:44]),
    .cin(cblk[11]),
    .sum(sum[47:44]),
    .cout(),
    .Pblk(Pblk[11]),
    .Gblk(Gblk[11])
  );

  cla4 block12 (
    .a(a[51:48]),
    .b(b[51:48]),
    .cin(cblk[12]),
    .sum(sum[51:48]),
    .cout(),
    .Pblk(Pblk[12]),
    .Gblk(Gblk[12])
  );

  cla4 block13 (
    .a(a[55:52]),
    .b(b[55:52]),
    .cin(cblk[13]),
    .sum(sum[55:52]),
    .cout(),
    .Pblk(Pblk[13]),
    .Gblk(Gblk[13])
  );

  cla4 block14 (
    .a(a[59:56]),
    .b(b[59:56]),
    .cin(cblk[14]),
    .sum(sum[59:56]),
    .cout(),
    .Pblk(Pblk[14]),
    .Gblk(Gblk[14])
  );

  cla4 block15 (
    .a(a[63:60]),
    .b(b[63:60]),
    .cin(cblk[15]),
    .sum(sum[63:60]),
    .cout(),
    .Pblk(Pblk[15]),
    .Gblk(Gblk[15])
  );

  // --------------------------------------------------
  // Second-level carry lookahead
  //
  // cblk[k] is the carry INTO block k.
  //
  // cblk[k] =
  // Gblk[k-1]
  // + Pblk[k-1]Gblk[k-2]
  // + Pblk[k-1]Pblk[k-2]Gblk[k-3]
  // + ...
  // + Pblk[k-1]...Pblk[0]cin
  // --------------------------------------------------

  assign #(2) cblk[1] =
      Gblk[0]
    | (Pblk[0] & cin);

  assign #(2) cblk[2] =
      Gblk[1]
    | (Pblk[1] & Gblk[0])
    | (Pblk[1] & Pblk[0] & cin);

  assign #(2) cblk[3] =
      Gblk[2]
    | (Pblk[2] & Gblk[1])
    | (Pblk[2] & Pblk[1] & Gblk[0])
    | (Pblk[2] & Pblk[1] & Pblk[0] & cin);

  assign #(2) cblk[4] =
      Gblk[3]
    | (Pblk[3] & Gblk[2])
    | (Pblk[3] & Pblk[2] & Gblk[1])
    | (Pblk[3] & Pblk[2] & Pblk[1] & Gblk[0])
    | (Pblk[3] & Pblk[2] & Pblk[1] & Pblk[0] & cin);

  // Remaining block carries are generated using the same
  // direct lookahead pattern.

  genvar k, j;

  generate
    for (k = 5; k <= 16; k = k + 1) begin : gen_block_carry

      wire [k:0] term;

      // Gblk[k-1]
      assign #(2) term[0] = Gblk[k-1];

      // Pblk[k-1]...Pblk[k-1-j+1] Gblk[k-1-j]
      for (j = 1; j < k; j = j + 1) begin : gen_product
        assign #(2) term[j] =
          (&Pblk[k-1 -: j]) & Gblk[k-1-j];
      end

      // Pblk[k-1]...Pblk[0] cin
      assign #(2) term[k] =
        (&Pblk[k-1:0]) & cin;

      // OR all terms
      assign #(2) cblk[k] = |term;

    end
  endgenerate

  // Final carry-out
  assign #(2) cout = cblk[16];

endmodule
