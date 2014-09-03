mercury = require("mercury")
h = mercury.h

clicks = mercury.input()
clickCount = mercury.value(0)

clicks -> clickCount.set(clickCount() + 1)

render = (clickCount) ->
  h "div.counter", [
    "The state ", h("code", "clickCount"),
    " has value: " + clickCount + ".", h "input.button",
      type: "button",
      value: "Click me!",
      "ev-click": mercury.event(clicks)
  ]

window.addEventListener "DOMContentLoaded", ->
  console.log 'initialized'
  mercury.app(document.body, clickCount, render)
