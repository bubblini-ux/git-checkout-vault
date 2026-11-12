new_repo
echo "# App" > README.md
commit "Initial commit"

git switch -q -c feature/profile
echo "profile page" > profile.txt
commit "Add profile page"
echo "avatar upload" >> profile.txt
commit "Add avatar upload"

git switch -q main
echo "home page" > home.txt
commit "Add home page"
echo "footer" > footer.txt
commit "Add footer"
