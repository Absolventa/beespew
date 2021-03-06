# Beespew [![Build Status](https://travis-ci.org/Absolventa/beespew.svg?branch=master)](https://travis-ci.org/Absolventa/beespew)

**Beespew** is a lightweight spam protection plugin for Rails using
honeypot input fields. Beespew … honeypot … get it? :wink:

## Installation

Add this line to your application's Gemfile:

    gem 'beespew'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install beespew

## Usage

### Model

You can enable **Beespew** on an ActiveModel model like this:

    class Comment < ActiveRecord::Base
      include Beespew::Model
    end

It will simply add an accessor called `beespew` (the honeypot) with a
validation that requires it to remain empty. An additional `#spam?` predicate
returns if something fell into the trap.

### View

Add a text field to your form:

    form_for :comment do |f|
      # ...
      f.text_field :beespew, placeholder: "If you are a human, leave this blank", class: 'beespew'
    end

Alternatively, you can use Beespew's form helper:

    form_for :comment, builder: Beespew::FormBuilder do |f|
      # ...
      f.honeypot, placeholder: "If you are a human, leave this blank"
    end

**Note**: Don't use `hidden_field` as bots are "smart" enough to leave those untouched.
Use CSS to hide it for human users and avoid `display:none` and
`visibility:hidden` here as well.

Example CSS:

    .beespew {
      position: absolute !important;
      height: 1px; width: 1px;
      overflow: hidden;
      clip: rect(1px 1px 1px 1px); /* IE6, IE7 */
      clip: rect(1px, 1px, 1px, 1px);
    }

### Controller

**Beespew** currently lacks a convenient way to automatically filter requests that
hit the honeypot. An example would be:

    class CommentsController < ApplicationController

      def create
        @comment = Comment.new(comment_params)
        deny_spam!

        # continue processing comment
      end

      protected

      def comment_params
        params.require(:comment).permit(:name, :message, :beespew)
      end

      def deny_spam!
        render text: 'spam protection in place', status: 403 and return if @comment.spam?
      end

    end

**Note**: Add the honeypot attribute to the list of permitted params, otherwise
strong parameters will unwillingly disable your spam protection.

## Changelog

### HEAD (not released yet)

### 2.1.0
* Compatible with rails 5.2
* Drop support for Rails < 5.0
* Switch to ruby 2.5

### 2.0.0
* Compatible with rails 5.1
* Drop support for Rails < 5.0
* Switch to ruby 2.4

### 1.0.1
* Relax rails dependency requirements
* Freeze string literals

### 1.0.0
* Require Ruby >= 2.1
* Set honeypot field with a [tabindex of -1](https://www.w3.org/TR/html5/editing.html#sequential-focus-navigation-and-the-tabindex-attribute)

### 0.2.0
* Add Beespew form builder with `honeypot` field
* Make Beespew.attribute configurable ([#1](https://github.com/Absolventa/beespew/issues/1))
* Add a default hidden style for honeypot field ([#3](https://github.com/Absolventa/beespew/issues/3))

### 0.1.0
* Initial working version
