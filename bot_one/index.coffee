

c = console.log.bind console
clr = require 'bash-color'
ee = require 'event-emitter'

emitter = new ee()


c (clr.cyan 'hi', on)



state = 
    attr_one: 343,
    attr_two: 34342,
    attr_three: 'hello'




R = {}

R.do_that = (payload, state) ->
    c 'do that'
    state
    effects
        type: 'do_effect_two'
        payload: 'something'




reducer = (type, payload, state) -> 
    if Object.keys(R).includes type
        R[type] payload # This is returning state
    else
        c clr.yellow "No-op in reducer with type:", type
        state





E = {}



E.do_effect_one = (payload) ->
    # do stuff
    # maybe we want to call the reducer now
    # but the only consumer of state is the effects api
    reducer('do_that', 'nothing')



E.do_effect_two = (payload) ->
    c 'effect two'

effects = ({ type, payload }) ->
    if Object.keys(E).includes type
        E[type] payload
    else
        c clr.yellow "No-op in effects with type:", type
        # effects are fire and forget, simpler case than state management, nothing to mutate / return





effects
    type: 'do_effect_one',
    payload: 'nothing'
