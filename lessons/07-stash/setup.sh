new_repo
echo "1.0.0-brokn" > version.txt
echo "search: exact matching" > search.txt
commit "Initial commit"

git switch -q -c feature/search
echo "search: prefix matching" >> search.txt
commit "Add prefix matching"

echo "search: fuzzy matching" >> search.txt
echo "idea: search-as-you-type" > ideas.txt
