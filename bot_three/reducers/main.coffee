

c = console.log.bind console
clr = require 'bash-color'


R = {}



DATA = {}

DATA.default_msg = ({ payload, state }) ->



R.have_spark = ({ payload, state }) ->
    { spark } = payload

    state.spark = spark
    state

R.user_enters_msg = ({ payload, state }) ->
    { value } = payload
    state.msg_queue.push value
    state.chat_log.push
        value: value,
        acked: false
    state



R.have_data = ({ payload, state }) ->

    state


R.do_something = ({ payload, state }) ->
    c (clr.purple 'doing something', on)
    state


module.exports = R
