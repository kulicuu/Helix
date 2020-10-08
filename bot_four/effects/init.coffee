c = console.log.bind console
clr = require 'bash-color'
Primus = require 'primus'
# http = require 'http'










module.exports = (reducer) ->

    E = {}


    E.init = () ->
        c 'init'
        primus2 = Primus.createServer
            port: 3001
        primus2.on 'connection', (spark) ->
            reducer
                type: 'have_spark'
                payload: { spark }
            spark.on 'data', (data) ->
                reducer
                    type: 'have_data'
                    payload: { data }



        Socket = Primus.createSocket()
        client = new Socket('http://localhost:3000')


        client.write
            type: "hello09303030"

        client.on 'data', (data) ->
            c 'client have data', data

            reducer
                type: 'have_data'
                payload: { data }


    E