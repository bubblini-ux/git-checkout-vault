new_repo
printf 'flour\nwater\n' > recipe.txt
printf 'oven=220\ntimer=30\n' > settings.txt
commit "Add bread recipe"

printf 'flour\nwater\nsalt\n' > recipe.txt
commit "Add salt"
git tag v1.0

printf 'flour\nwater\nsalt\nyeast\n' > recipe.txt
commit "Add yeast"

printf 'oven=900\ntimer=3\n' > settings.txt
commit "Tweak settings"

printf 'flour\nwater\nsalt\nyeast\nolive oil\n' > recipe.txt
commit "Add olive oil"
