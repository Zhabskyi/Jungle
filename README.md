# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.
Use can Login and Logout, add products to the cart and do checkout through Stripe service.
App has admin page where admin can change, delete or add products.


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

Env expample:
```
STRIPE_PUBLISHABLE_KEY=your_test_key_here
STRIPE_SECRET_KEY=your_test_key_here

USERNAME=your_username_here
PASSWORD=your_password_here
```

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Final Product

Main Page:

!["Main page"](https://github.com/Zhabskyi/Jungle/blob/master/app/assets/images/1.png?raw=true)

Product highlights:

!["highlights"](https://github.com/Zhabskyi/Jungle/blob/master/app/assets/images/2.png?raw=true)

Cart:

![Admin page](https://github.com/Zhabskyi/Jungle/blob/master/app/assets/images/3.png?raw=true)

Admin Page:

![Admin page](https://github.com/Zhabskyi/Jungle/blob/master/app/assets/images/4.png?raw=true)

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
