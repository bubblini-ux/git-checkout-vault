new_repo
printf 'coffee: 3\nbagel: 2\n' > prices.txt
commit "Add price list"

git switch -q -c feature/hours
echo "Open 7am-5pm" > hours.txt
commit "Add opening hours"

git switch -q main
git switch -q -c feature/pricing
printf 'coffee: 5\nbagel: 2\ntea: 3\n' > prices.txt
commit "Raise coffee price to 5 and add tea"

git switch -q main
printf 'coffee: 4\nbagel: 2\n' > prices.txt
commit "Raise coffee price to 4"
