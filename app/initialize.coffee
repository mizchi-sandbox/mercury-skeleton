mercury = require "mercury"
{h} = mercury

appState = mercury.value
  title: 'Hello'
  items: [0..2]

update = mercury.input()
update ->
  state = _.cloneDeep appState()
  state.items.push state.items.length
  appState.set state

render = (state) ->
  h "div", [
    h 'h1', state.title
    h "button", {"ev-click": mercury.event update}, "update"
    h 'ul', {}, state.items.map (item) -> h 'li', {}, item.toString()
  ]

window.addEventListener "DOMContentLoaded", ->
  mercury.app document.body, appState, render
