# rom-playground

```ruby
Core.setup.finalize
Core.command(:users).create.call(name: 'test', email: 'test@gmaik.com')
Core.command(:users).create.call(name: 'test1', email: 'test1@gmaik.com')
Core.command(:users).create.call(name: 'test2', email: 'test2@gmaik.com')
Core.relation(:users).
  filter(:name, :regexp, /\d$/).
  offset(1).
  limit(1).
  as(:entity).
  to_a # => [#<Core::Models::User:0x007f1de86da468 @name="test2", @email="test2@gmaik.com">]
Core.relation(:users).
  filter(:name, :regexp, /\d$/).
  order(:name, :desc).
  offset(1).
  limit(1).
  as(:entity).
  to_a # => [#<Core::Models::User:0x007fed7e526e30 @name="test1", @email="test1@gmaik.com">]
```
