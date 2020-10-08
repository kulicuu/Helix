c = console.log.bind console
clr = require 'bash-color'
Primus = require 'primus'
prompts = require 'prompts'






module.exports = (reducer) ->


    E = {}


    E.init = () ->
        c (clr.green "Init", on)

        primus = Primus.createServer
            port: 3000

        primus.on 'connection', (spark) ->
            reducer
                type: 'have_spark'
                payload: { spark }
            spark.on 'data', (data) ->
                reducer
                    type: 'have_data'
                    payload: { data }


        condition = false

        while condition is false
            response = await prompts
                type: 'text'
                name: 'value'
                message: 'chat message'
            c response, (clr.white 'response', on)
            { value } = response
            if value is 'quit'
                condition = true
            else
                reducer
                    type: 'user_enters_msg'
                    payload: { value }

    E