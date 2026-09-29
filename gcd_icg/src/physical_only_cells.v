// The supplied DEF/netlist contains physical-only FILLTAPH7R instances.
// ICS55 has no timing Liberty model for this filler, so Yosys needs a
// black-box declaration while reading the gate-level netlist.
(* blackbox *)
module FILLTAPH7R ();
endmodule
