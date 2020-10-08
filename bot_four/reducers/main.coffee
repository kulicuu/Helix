

c = console.log.bind console
clr = require 'bash-color'


R = {}



R.have_data = ({ payload, state }) ->
    c state.chat_log
    state.chat_log.push payload.data.payload.msg


    state


R.do_something = ({ payload, state }) ->
    c (clr.purple 'doing something', on)
    state


module.exports = R
