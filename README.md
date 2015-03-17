# rom-playground

```ruby
Core.setup.finalize
Core.command(:users).create.call(name: 'test', email: 'test@gmaik.com')
Core.command(:users).create.call(name: 'test1', email: 'test1@gmaik.com')
Core.command(:users).create.call(name: 'test2', email: 'test2@gmaik.com')
Core.relation(:users).filter(:name, /\d$/, operator: :regexp).as(:entity).to_a
```
