here="$PWD"
git init -q --bare -b main origin.git

# Seed the "server" with a little history.
tmp="$(mktemp -d)"
new_repo "$tmp/seed"
(
  cd "$tmp/seed"
  echo "# Team project" > README.md
  commit "Initial commit"
  echo "print('hello')" > app.py
  commit "Add app"
  git push -q "$here/origin.git" main
)
rm -rf "$tmp"

cat > teammate.sh <<'EOF'
#!/usr/bin/env bash
# Plays a colleague who pushes a commit to main on the server.
set -euo pipefail
here="$(cd "$(dirname "$0")" && pwd)"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

git clone -q "$here/origin.git" "$tmp/tess"
cd "$tmp/tess"
if [ -f CONTRIBUTING.md ]; then
  echo "Tess already pushed her commit."
  exit 0
fi
echo "Be kind. Write tests." > CONTRIBUTING.md
git add CONTRIBUTING.md
git -c user.name="Teammate Tess" -c user.email="tess@example.com" \
    -c commit.gpgsign=false commit -q -m "Add contributing guide"
git push -q origin main
echo "Tess pushed 'Add contributing guide' to main on origin."
EOF
chmod +x teammate.sh
