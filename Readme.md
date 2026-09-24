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

## Flow e2e checks (lit)

This repository also hosts the `ecc-flow-e2e` lit suite (`lit.cfg.py` at the
root). Each `<name>/<name>.lit` file checks the workspace produced by running
the design through an `ecc` binary (typically the PyInstaller bundle) with
ecc's `nix/scripts/run-designs.sh`:

```bash
# in an ecc checkout
bash nix/scripts/run-designs.sh --ecc <ecc-binary> --designs-dir <this-repo> \
    --out-root /tmp/e2e
ECC_FLOW_WORKSPACES=/tmp/e2e bash nix/scripts/signoff-lit.sh <this-repo>
```

A `<name>.lit` case starts with `; REQUIRES: flow-<name>` and uses `%flows`
(the run output root), `%filecheck` and `%jq`. Pin report structure, not
numbers — see `xtea/` for the reference layout (`checks/*.check` +
`xtea.lit`). Adding a design is adding one self-contained directory; nothing
changes in the ecc repo.

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
