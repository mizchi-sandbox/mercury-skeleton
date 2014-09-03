(ns app
  (:require [mercury :as m]))
(def h m.h)

(def app-state (m.value
                {:title "Hello mercury"
								 :items [0 1 2]}))

(def update (mercury.input))
(update (fn []
				  (let [state (_.cloneDeep (app-state))
    			      item-count state.items.length]
				 			 (state.items.push item-count)
							 (appState.set state))))

(defn render [state]
 	(h "div" [
	 	(h :h1 state.title)
    (h :button {:ev-click (m.event update)} "Add")
	 	(h :ul (state.items.map (fn [item] (h :li (item.toString)))))
  ]))

(window.addEventListener "DOMContentLoaded", (fn []
  (m.app document.body appState render)))
