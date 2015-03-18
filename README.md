# rom-playground

```ruby
# Configure is optional, memory adapter is default
Core.configure do |config|
  config.adapter = :sql
  config.dsn = 'sqlite::memory'
end
Core.load.finalize
Core.command(:users).create.call(name: 'test', email: 'test@gmaik.com')
Core.command(:users).create.call(name: 'test1', email: 'test1@gmaik.com')
Core.command(:users).create.call(name: 'test2', email: 'test2@gmaik.com')
Core.relation(:users).
  filter(:name, :gt, 'test').
  offset(1).
  limit(1).
  as(:entity).
  to_a # => [#<Core::Models::User:0x007f1de86da468 @name="test2", @email="test2@gmaik.com">]
Core.relation(:users).
  filter(:name, :gt, 'test').
  order(:name, :desc).
  offset(1).
  limit(1).
  as(:entity).
  to_a # => [#<Core::Models::User:0x007fed7e526e30 @name="test1", @email="test1@gmaik.com">]
```
