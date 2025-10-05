#!/usr/bin/env bash
set -e

# --- Config ---
AVD_VERSION="5.7.0"
ANSIBLE_VERSION="<2.19"   # AVD 5.x supports ansible-core 2.15–2.18.x
VENV_DIR=".venv"

echo ">>> Creating virtual environment: $VENV_DIR"
python3 -m venv "$VENV_DIR"
source "$VENV_DIR/bin/activate"

echo ">>> Upgrading pip & wheel"
python -m pip install --upgrade pip wheel

echo ">>> Installing ansible-core ($ANSIBLE_VERSION)"
pip install "ansible-core$ANSIBLE_VERSION"

echo ">>> Installing pyavd ($AVD_VERSION) with ansible extras"
pip install "pyavd[ansible]==$AVD_VERSION"

echo ">>> Installing Arista AVD collection ($AVD_VERSION)"
ansible-galaxy collection install "arista.avd:==$AVD_VERSION" --force

echo ">>> Verifying pyavd install"
python - <<'PY'
import importlib.metadata as m
print("pyavd:", m.version("pyavd"))
PY

echo ">>> Done!"
echo "Activate your venv with: source $VENV_DIR/bin/activate"
echo "Run playbooks with: $VENV_DIR/bin/ansible-playbook <playbook>.yml"

