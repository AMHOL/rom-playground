# rom-playground

```ruby
Core.setup.finalize
Core.command(:users).create.call(email: 'test@gmaik.com')
Core.relation(:users) { |r|
  r.by_email('test@gmaik.com')
}.as(:entity).first
```
