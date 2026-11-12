new_repo
echo "# Project" > README.md
commit "Initial commit"

git switch -q -c feature/readme
printf '# Project\n\nThis projct does things.\n' > README.md
commit "Add intro"
printf '# Project\n\nThis project does things.\n' > README.md
commit "fix typo"
printf '# Project\n\nThis project does things.\n\n## Instal\n\nRun make.\n' > README.md
commit "wip"
printf '# Project\n\nThis project does things.\n\n## Install\n\nRun make.\n' > README.md
commit "oops, fix typo again"

git tag backup/original
