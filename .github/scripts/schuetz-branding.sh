#!/usr/bin/env bash
set -euo pipefail
cfg=libs/hbb_common/src/config.rs
sed -i 's|RwLock::new("RustDesk".to_owned())|RwLock::new("Schütz-Digital Support".to_owned())|' "$cfg"
sed -i 's|&\["rs-ny.rustdesk.com"\]|\&["2.31.25.199"]|' "$cfg"
sed -i 's|^pub const RS_PUB_KEY: &str = ".*";|pub const RS_PUB_KEY: \&str = "hjTAXLdIWz3OFVeKwljo9VtBOO2xJCHyRpXPdRhzgRQ=";|' "$cfg"
grep -q '2.31.25.199' "$cfg" && grep -q 'hjTAXLdIWz3OFVeKwljo9VtBOO2xJCHyRpXPdRhzgRQ=' "$cfg" && grep -q 'Schütz-Digital Support' "$cfg"
