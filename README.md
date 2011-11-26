# RShot

RShot is a Ruby library that takes screenshots of web pages.

## How to use it

    require "rshot"
    
    r = RShot.new
    r.render_url "http://www.google.com", "whatever.png"
    
Yeah the API is a little sketchy, but I there'll be a good reason for that in the future, I promise!

## Issues

* It crashes Ruby on exit
* [The code does shit like this](https://github.com/charliesome/RShot/blob/master/ext/rshot/rshot.m#L35)

## Example

![google homepage](http://i.imgur.com/Y886s.png)