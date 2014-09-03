mercury = require "mercury"
{h} = mercury

clicks = mercury.input()
clickCount = mercury.value 0

clicks -> clickCount.set clickCount() + 1

render = (clickCount) ->
  h "div.counter", [
    h "span", "count: "+clickCount
    h "input", {
      className: 'btn'
      type: "button"
      value: "Click me!"
      "ev-click": mercury.event clicks
    }
  ]

window.addEventListener "DOMContentLoaded", ->
  console.log 'initialized'
  mercury.app(document.body, clickCount, render)
