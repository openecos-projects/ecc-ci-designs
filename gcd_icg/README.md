# gcd_icg

Gate-level GCD regression containing two `ICGX0P5H7L` integrated clock-gate
instances.  The CI fixture runs the `syn_sta` preset and asserts that both
clock gates survive ECC's synthesis input handling.

`inputs/gcd_icg.def`, `inputs/gcd_icg.spef`, and
`constraints/gcd_icg.sdc` are the original post-route timing inputs.  They
are retained for direct STA work; for example:

```bash
ecc run --project gcd_icg --workspace sta-only --from STA --to STA
```

`FILLTAPH7R` is a physical-only fill cell present in the supplied netlist but
not in the ICS55 timing Liberty set.  `src/physical_only_cells.v` declares it
as a Yosys black box so the mapped netlist can be read without changing its
logic or its clock-gate cells.
