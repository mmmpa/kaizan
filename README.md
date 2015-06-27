[![Build Status](https://travis-ci.org/mmmpa/kaizan.svg)](https://travis-ci.org/mmmpa/kaizan)
[![Coverage Status](https://coveralls.io/repos/mmmpa/kaizan/badge.svg?branch=master)](https://coveralls.io/r/mmmpa/kaizan?branch=master)

# Kaizan

Kaizan（改ざん）はActionViewのテンプレート内で、下の方から上の方の指定領域に文字列を書き込むために書かれました。

`altering_anchor`で場所を指定しておいて`alter_past`で書き込みます。

```html
<h1>モデルたち <%= altering_anchor :displayed %>/<%= @models.count %></h1>
<ul>
  <% displayed_count = 0 %>
  <%= @models.each do |model| %>
    <li><%= if model.display?
      displayed += 1
      model.full_name
    else
      '非公開'
    end %></li>
  <% end %>
</ul>
<% alter_past :displayed, displayed_count %>
```
が
```html
<h1>モデルたち 3/5</h1>
<ul>
  <li>モデル太郎</li>
  <li>非公開</li>
  <li>モデル三郎</li>
  <li>モデル史郎</li>
  <li>非公開</li>
</ul>
```
です。

## Installation

```ruby
gem 'kaizan'
```

    $ bundle install
