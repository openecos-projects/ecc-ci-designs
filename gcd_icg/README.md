# gcd_icg

This ICS55 v2 regression runs the `rtl2gds` preset on a mapped GCD netlist. Its two `CKGTX0P5_9TSVT` instances gate the A and B register banks. The lit test checks the number of gates in the new synthesis output and the exported signoff archive.

The inputs under `v2/` come from one 100 MHz run of ECC's `test/fixtures/gcd/gcd.v` against public PDK commit `b021e8329b29a8407550563ed769f7f7a15a8683`. `gcd_synthesis.v` is the synthesis-stage netlist with source paths shortened. `gcd.v`, `gcd.def` and `gcd.spef` are from RC extraction of the same routed layout, using the TYPICAL 25 °C SPEF. `gcd.sdc` is the workspace's typical pre-CTS constraint file with ideal clocks for placement. The original v1 inputs are in `src/`, `inputs/` and `constraints/`.
