# ECC CI Usage

This repository is trimmed to the ECC CI sample set: `aes`, `APU`, `BM64`,
`picorv32a`, `usb`, `xtea`, `y_huff`, and `zipdiv`.

Each selected design is a standalone ECC project with an `ecc.toml` in its
design directory. Paths in `ecc.toml` are relative to that directory.

Run a design with:

```bash
ecc check --project openlane2-ci-designs/aes
ecc run --project openlane2-ci-designs/aes --overwrite
```

The CI environment must provide the ICS55 PDK root through
`CHIPCOMPILER_ICS55_PDK_ROOT` or `ICS55_PDK_ROOT`.

---

# OpenLane CI Designs

These are designs used in the testing of OpenLane 2 or higher.

They are not meant to serve as a reference *per se*. Matter of fact is, some of
them are pretty bad. But they do exercise crucial functionality in OpenLane.

# License

Each design has its own license. You may check the source headers for the files
for said license.

If a file lacks a license and/or something is unclear, feel free to file an issue
in the [OpenLane repository](https://github.com/efabless/openlane2).
