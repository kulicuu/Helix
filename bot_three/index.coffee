

c = console.log.bind console
clr = require 'bash-color'
ee = require 'event-emitter'



state_emitter = new ee()


R = {}


R = Object.assign R, require('./reducers/main.coffee')


reducer_precursor = ->
    # ideally, state is immutable, but this is javascript.
    state = 
        msg_queue: [],
        chat_log: [],
        attr_one: 343,
        attr_two: 34342,
        attr_three: 'hello'
    ({ type, payload }) ->
        c type, (clr.blue type, on)
        if Object.keys(R).includes type
            state = R[type] { payload, state }
            state_emitter.emit 'state_change', state
        else
            c (clr.yellow "No-op in reducer with type:", on), 
                (clr.cyan type, on)


reducer = reducer_precursor()

E = {}

E = Object.assign E, require('./effects/init.coffee')(reducer)



E.set_up_state_listener = (payload) ->
    old_state = null
    listener = (state) ->

        while msg = state.msg_queue.pop()
            c msg, 'msg'
            state.spark.write
                type: 'chat_msg_server'
                payload: { msg }

        old_state = state

    state_emitter.on 'state_change', listener


effects = ({ type, payload }) ->
    if Object.keys(E).includes type
        E[type] payload
    else
        c (clr.yellow "No-op in effects with type:", on),
            (clr.cyan type, on)
        # effects are fire and forget, simpler case than state management, nothing to mutate / return



effects
    type: 'set_up_state_listener'
    payload: 'none'


effects
    type: 'do_effect_one',
    payload: 'nothing'

effects
    type: 'init'
    payload: null
