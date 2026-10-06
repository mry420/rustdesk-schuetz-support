#!/usr/bin/env bash
set -euo pipefail
cfg=libs/hbb_common/src/config.rs
sed -i.bak 's|RwLock::new("RustDesk".to_owned())|RwLock::new("Schuetz-Digital Support".to_owned())|' "$cfg"
sed -i.bak 's|&\["rs-ny.rustdesk.com"\]|\&["support.schuetz-media.net"]|' "$cfg"
sed -i.bak 's|^pub const RS_PUB_KEY: &str = ".*";|pub const RS_PUB_KEY: \&str = "hjTAXLdIWz3OFVeKwljo9VtBOO2xJCHyRpXPdRhzgRQ=";|' "$cfg"
sed -i.bak 's|^\( *pub static ref DEFAULT_SETTINGS: RwLock<HashMap<String, String>> = \)Default::default();|\1RwLock::new(HashMap::from([("custom-rendezvous-server".to_owned(), "support.schuetz-media.net".to_owned()), ("relay-server".to_owned(), "support.schuetz-media.net".to_owned()), ("key".to_owned(), "hjTAXLdIWz3OFVeKwljo9VtBOO2xJCHyRpXPdRhzgRQ=".to_owned())]));|' "$cfg"
rm -f "$cfg.bak"
grep -q 'support.schuetz-media.net' "$cfg" && grep -q 'hjTAXLdIWz3OFVeKwljo9VtBOO2xJCHyRpXPdRhzgRQ=' "$cfg" && grep -q 'Schuetz-Digital Support' "$cfg" && grep -q 'custom-rendezvous-server".to_owned(), "support.schuetz-media.net"' "$cfg"
perl -i -pe 's|"RustDesk",|"Schuetz-Digital Support",|' flutter/lib/desktop/widgets/tabbar_widget.dart
