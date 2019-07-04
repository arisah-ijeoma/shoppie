# README

Shoppie is a simple eCommerce application. There is no payment feature implemented.

To run locally, do the following:
1. run `git clone https://github.com/arisah-ijeoma/shoppie.git`
1. set ruby version to 2.5.1
1. run `bundle`
1. run `rails db:create db:seed`
1. run `rspec`. Specs should run green
1. run `rails s`
1. open the user facing app with this address`http://localhost:3000` on your browser
1. open the admin app with this address `http://localhost:3000` on your browser. Use `admin@example.com` for email and `password` for password

To visit the live site, go to `https://infinite-refuge-11092.herokuapp.com/` and `https://infinite-refuge-11092.herokuapp.com/admin` respectively.
Since it is a sample application, the admin email and password are the same as the local one.

## Future TODOS
1. Nest sub categories in parent categories on dropdowns
1. Authorization
