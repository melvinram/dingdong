# Heimdall

Experimental app to explore ideas around decomposing a monolith as well as 
building an app in such as way that it's easy to decompose it later.


## Running Tests

Prepare database:

```
rails db:test:prepare
```

Run tests:

```
rails test
```

Run a specific test:
```
rails test test/services/accounts/create_pending_account_saga_step_test.rb:24
```
