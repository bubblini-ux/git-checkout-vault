new_repo
echo "# Site" > README.md
commit "Initial commit"
git branch old-idea

echo "home page" > index.txt
commit "Add home page"

git switch -q -c tmp
echo "a wild idea" > idea.txt
commit "Try a wild idea"
git switch -q main
git rev-parse main > .git/vault-main
