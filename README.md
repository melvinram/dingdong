# Heimdall

Experimental app to explore ideas around decomposing a monolith as well as 
building an app in such as way that it's easy to decompose it later.

## Style

### Service Module

Each future service lives within it's own top level namespace. 

Ex: `Accounts` and `Users`.

These namespaces are called Service Modules.

### Service Resource

Within a Service Module, there are going to many classes.

Ex. `Accounts::Account`

These classes are going to correspond with resources in the future service 
so they are called Service Resources.

### Service Object

Any instance of a service resource is called a Service Object.

### Creation Of Service Objects

In normal Rails programming, there are two ways of creating new records:

```ruby
Account.new(account_params).save
Account.create(account_params)
``` 

For the service resources, we're standardizing on one pattern for creation, like this:

```ruby
Accounts::Account.create(params)
# => <Accounts::Account id=2345>
```

The parameters that are passed in can contain just the attribute details for this resource or it 
can also contain details for associated resources that will need to be created, such as an Owner 
(User) being created at the same time a User is being created.

*Open questions:*

* What about bulk creates?

### Updating Service Objects

Updating of service objects can happen two ways but only the first way is canonical:

Retrieve & then update
```ruby
account = Account.retrieve(account_id: account_id)
account.name = "New Name"
outcome = account.save
``` 

Update directly 
```ruby
outcome = Account.update(account_id: account_id, name: "New Name")
``` 

This second approach is more performant so it might be relevant in some cases but
there really should be one canonical way to do this and the first approach seems 
more object oriented.

*Open questions:*

* What about partial updates?

### Sagas for orchestrating multi-step, multi-service executions

When in a single app, transactions are a powerful tool for making that everything happened 
or nothing happened. Transactions are not available across 
services. "Sagas" are one way to get the same effect. 

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
