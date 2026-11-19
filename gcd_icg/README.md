# gcd_icg

Gate-level GCD regression containing two `ICGX0P5H7L` integrated clock-gate
instances.  The CI fixture runs the `rtl2gds` preset and asserts that both
clock gates survive ECC's synthesis input handling and appear on the final
STA's propagated clock paths. The pre-CTS clocks are ideal, so the worst
post-synthesis data paths are not required to contain a clock-gate cell.

`inputs/gcd_icg.def`, `inputs/gcd_icg.spef`, and
`constraints/gcd_icg.sdc` are the original post-route timing inputs.
`ecc.toml` selects `constraints/timing_inputs.tcl`, which expresses the same
clock and IO commands in ECC's five-group input format. Despite its suffix,
this input contains TOML strings, not an executable Tcl script. ECC adds its
standard timing rules and generates the native pre/post-CTS scenario scripts.
The original SDC remains unchanged for reference and other timing tools.

The supplied DEF and SPEF can also be used for a direct ECC STA run:

```bash
ecc run --project gcd_icg --workspace sta-only --from STA --to STA
```

`FILLTAPH7R` is a physical-only fill cell present in the supplied netlist but
not in the ICS55 timing Liberty set.  `src/physical_only_cells.v` declares it
as a Yosys black box so the mapped netlist can be read without changing its
logic or its clock-gate cells.
