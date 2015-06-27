[![Build Status](https://travis-ci.org/mmmpa/kaizan.svg)](https://travis-ci.org/mmmpa/kaizan)
[![Coverage Status](https://coveralls.io/repos/mmmpa/kaizan/badge.svg?branch=master)](https://coveralls.io/r/mmmpa/kaizan?branch=master)

# Kaizan

Kaizan（改ざん）はActionViewのテンプレート内で、下の方から上の方の指定領域に文字列を書き込むために書かれました。

`altering_anchor`で場所を指定しておいて`alter_past`で書き込みます。

```html
<h1>モデルたち <%= altering_anchor :displayed %>/<%= @models.count %></h1>
<ul>
  <% displayed_count = 0 %>
  <% @models.each do |model| %>
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

## Usage

```html
<h1>Altering Past Buffer</h1>
<ul>
    <li class="case1"><%= '<xmp>not safe string' %></li>
    <li class="case2"><%= altering_anchor %></li>
    <li class="case3"><%= altering_anchor %></li>
    <li class="case4"><%= altering_anchor %></li>
    <li class="case5"><%= altering_anchor :named_anchor %></li>
    <li class="case6"><%= altering_anchor :named_anchor %></li>
    <li class="case7"><%= altering_anchor :foot_line %></li>
</ul>
<%= altering_anchor %>
<% alter_past(0, :string) %>
<% alter_past(1, '<xmp>Not safe altering') %>
<% alter_past(2, '<strong>Safe altering</strong>'.html_safe) %>
<% alter_past(:named_anchor, 'Multiple altering') %>
<% alter_past(:foot_line, 'Thank you') %>
<% alter_past(:not_exit_anchor, 'Not exist') %>
<footer>Concatenated</footer>
```

1. `<%= %>`と`altering_anchor(name = nil)`で場所を指定する。  
nameはなくても大丈夫。
1. `alter_past(name, content)`で置換する。  
nameが整数の場合、`altering_anchor`された順のインデックス位置を置換。  
nameがSymbolなどの場合、`altering_anchor`で指定されたnameと同じ位置をすべて置換。
1. 置換されないとanchor文字列が残る。
1. htmlを入れたい場合は`html_safe`を使う。

```html
<h1>Altering Past Buffer</h1>
<ul>
    <li class="case1">&lt;xmp&gt;not safe string</li>
    <li class="case2">string</li>
    <li class="case3">&lt;xmp&gt;Not safe altering</li>
    <li class="case4"><strong>Safe altering</strong></li>
    <li class="case5">Multiple altering</li>
    <li class="case6">Multiple altering</li>
    <li class="case7">Thank you</li>
</ul>
<!-- altering_anchor:526c675d724f3e5b8ae68ec1e661f2b4 -->
<footer>Concatenated</footer>
```
