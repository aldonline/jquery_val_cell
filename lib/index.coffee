###
Returns a cell with a _destroy() method to disconnect it
from the target element
Dependencies are injected, not required.
###
module.exports = ( {$e, bidibinder, rcell, reactivity} ) ->
  
  # we have an element $e on the left
  # and a cell on the right
  cell = rcell()

  # we bind them together using the bidibinder
  bb = bidibinder
    get_a:     => $e.val()
    set_a: (x) => $e.val x
    get_b:     => cell()
    set_b: (x) => cell x

  # listen to change events on each side
  # and touch the bidibinder
  touch_a = -> bb.touch_a()
  touch_b = -> bb.touch_b()

  # cell
  stopper = reactivity cell, touch_b
  # element
  $e.on 'change', touch_a
  $e.on 'input',  touch_a

  cell._destroy = ->
    stopper()
    $e.off 'change', touch_a
    $e.off 'input',  touch_a

  touch_a()

  cell