# lit config for the ecc flow e2e suite.
#
# Each design directory (<name>/ecc.toml + rtl + checks/*.check + <name>.lit)
# is a self-contained ECC project. This suite only checks workspaces produced
# beforehand by ecc's nix/scripts/run_designs.sh; a design without a produced
# workspace reports UNSUPPORTED, not FAIL.
#
# Run (from the ecc repo checkout):
#   ECC_FLOW_WORKSPACES=<out-root> bash nix/scripts/signoff_lit.sh <this-repo>

import os
from pathlib import Path

import lit.formats

_ROOT = Path(__file__).resolve().parent
config.name = "ecc-flow-e2e"
config.test_format = lit.formats.ShTest(execute_external=True)
config.suffixes = [".lit"]
config.test_source_root = str(_ROOT)
config.test_exec_root = str(_ROOT / ".lit-out")

flows = os.environ.get("ECC_FLOW_WORKSPACES") or ""

config.substitutions.append(("%filecheck", os.environ.get("FILECHECK") or "filecheck"))
config.substitutions.append(("%jq", os.environ.get("JQ") or "jq"))

if flows:
    config.substitutions.append(("%flows", flows))
    for entry in sorted(Path(flows).iterdir()):
        if (entry / "default" / "home" / "flow.json").is_file():
            config.available_features.add(f"flow-{entry.name}")
