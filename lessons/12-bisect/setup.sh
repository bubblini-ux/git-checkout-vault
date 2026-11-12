new_repo
cat > test.sh <<'EOF'
#!/usr/bin/env bash
# Exits 0 when the tax rate is correct, 1 when the bug is present.
grep -qx 'rate=8' tax.conf
EOF
chmod +x test.sh
echo "rate=8" > tax.conf
echo "# Changelog" > CHANGELOG.md
commit "Initial release"
git tag v1.0

for i in $(seq 2 24); do
  echo "- change $i" >> CHANGELOG.md
  if [ "$i" -eq 15 ]; then echo "rate=80" > tax.conf; fi
  commit "Routine update $i"
done
