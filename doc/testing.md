
# Testing the contactme application

The main part of the application wasn't generated with scaffolding, 
but the Devise authentication system was installed that way.

So the application runs, but the tests don't work that well 
(or at all).  

This documents what was done to get the tests working.

## Initial login test 

The `features/support/paths.rb` file need a path matching the 
initial clause in the login scenario, to confirm being 
on the login page:

~~~~
    when /the users sign_in page/
      '/login'
~~~~

`/login` is handled in `config/routes.rb`
