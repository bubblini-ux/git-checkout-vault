new_repo
echo "# Shop" > README.md
commit "Initial commit"
echo "cart" > cart.txt
commit "Add cart"

git switch -q -c feature/payment
echo "payment form" > payment.txt
commit "Add payment form"
echo "validate card numbers" >> payment.txt
commit "Validate card numbers"
echo "refunds" > refund.txt
commit "Add refund flow"
git rev-parse HEAD > .git/vault-payment

git switch -q main
echo "checkout" > checkout.txt
commit "Add checkout page"
echo "shipping" > shipping.txt
commit "Add shipping options"
git rev-parse HEAD > .git/vault-main

# The disasters.
git branch -q -D feature/payment
git reset -q --hard HEAD~2
