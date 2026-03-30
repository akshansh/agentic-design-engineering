#!/usr/bin/env bash

set -euo pipefail

PLUGIN_NAME="agentic-design-engineering"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
SOURCE_DIR="${REPO_ROOT}/codex/${PLUGIN_NAME}"
TARGET_DIR="${HOME}/.codex/plugins/${PLUGIN_NAME}"
MARKETPLACE_PATH="${HOME}/.agents/plugins/marketplace.json"
SOURCE_PATH="./.codex/plugins/${PLUGIN_NAME}"

if [[ ! -d "${SOURCE_DIR}" ]]; then
  echo "Codex plugin source not found at ${SOURCE_DIR}" >&2
  exit 1
fi

mkdir -p "$(dirname "${TARGET_DIR}")"
rm -rf "${TARGET_DIR}"
mkdir -p "${TARGET_DIR}"
cp -R "${SOURCE_DIR}/." "${TARGET_DIR}/"

mkdir -p "$(dirname "${MARKETPLACE_PATH}")"

python3 - "${MARKETPLACE_PATH}" "${PLUGIN_NAME}" "${SOURCE_PATH}" <<'PY'
import json
import pathlib
import sys

marketplace_path = pathlib.Path(sys.argv[1]).expanduser()
plugin_name = sys.argv[2]
source_path = sys.argv[3]

default_marketplace = {
    "name": "local-plugins",
    "interface": {
        "displayName": "Local Plugins"
    },
    "plugins": []
}

if marketplace_path.exists():
    data = json.loads(marketplace_path.read_text())
else:
    data = default_marketplace

data.setdefault("name", "local-plugins")
data.setdefault("interface", {})
data["interface"].setdefault("displayName", "Local Plugins")

plugins = data.setdefault("plugins", [])
entry = {
    "name": plugin_name,
    "source": {
        "source": "local",
        "path": source_path
    },
    "policy": {
        "installation": "AVAILABLE",
        "authentication": "ON_INSTALL"
    },
    "category": "Design"
}

for index, plugin in enumerate(plugins):
    if plugin.get("name") == plugin_name:
        merged = dict(plugin)
        merged.update(entry)
        plugins[index] = merged
        break
else:
    plugins.append(entry)

marketplace_path.write_text(json.dumps(data, indent=2) + "\n")
PY

echo
echo "Installed ${PLUGIN_NAME} source to ${TARGET_DIR}"
echo "Updated personal marketplace at ${MARKETPLACE_PATH}"
echo
echo "Next steps:"
echo "1. Restart Codex."
echo "2. Open the plugin marketplace."
echo "3. Install or enable Agentic Design Engineering from your local marketplace."
echo
echo "Re-run this script any time you want to update the local Codex install from this checkout."
