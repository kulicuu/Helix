

c = console.log.bind console
clr = require 'bash-color'
ee = require 'event-emitter'



state_emitter = new ee()


R = {}


R.do_that = (payload, state) ->
    c 'do that', state
    state


reducer = (type, payload) ->
    # ideally, state is immutable, but this is javascript.
    state = 
        attr_one: 343,
        attr_two: 34342,
        attr_three: 'hello'
    if Object.keys(R).includes type
        state = R[type] payload, state
        state_emitter.emit 'state_change', state
    else
        c clr.yellow "No-op in reducer with type:", type


E = {}

# Discussion: The only possible consumer of state updates is the effects function.  Who decides if anything (effect)
# happens after a state change.  If we're not worried about being purely functional (I'm not generally these days)
#, we could do this in a reducer, but in general we won't want reducers to know, rather there will be something that
# assesses state and decides if there should be an effect triggered.
# Most simply, there is some function which takes state and outputs a list of effects to trigger.
# This function is itself an effect, and there could be multiple different of these functions.  
# and I guess if we want to be more pure about the whole thing, nothing in the state management can trigger anything,


E.do_effect_one = (payload) ->
    # do stuff
    # maybe we want to call the reducer now
    # but the only consumer of state is the effects api
    reducer('do_that', 'nothing')



E.do_effect_two = (payload) ->
    c 'effect two'
    effects
        type: 'do_effect_three'
        payload: 'none'

E.do_effect_three = (payload) ->
    c 'effect three 8888'



E.set_up_state_listener = (payload) ->
    listener = (state) ->
        c 'have a state change', state
        c (clr.blue "can analyze state and determine which effects we want to fire")
        effects
            type: 'do_effect_two'
            payload: 'something'

    state_emitter.on 'state_change', listener


effects = ({ type, payload }) ->
    if Object.keys(E).includes type
        E[type] payload
    else
        c clr.yellow "No-op in effects with type:", type
        # effects are fire and forget, simpler case than state management, nothing to mutate / return



effects
    type: 'set_up_state_listener'
    payload: 'none'


effects
    type: 'do_effect_one',
    payload: 'nothing'
