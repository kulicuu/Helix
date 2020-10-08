# Helix

## Summary

This _was_ a project to illustrate a universal stateful (or stateless) application pattern, started as a companion piece to a half-jesting Gist entitled [_Grand Unified Theory of Software_](https://gist.github.com/kulicuu/dbb45cef96b4b0b5bb9de5260624e810).  

Now, it's growing organically into a review exercise project for putting together my current paradigm patterns for distributed systems with Node.js, Golang, Python, React, Yew, Rust, Redis, Docker, and Kubernetes.


## Design and Goal:

Actually, this isn't clear at the moment.  I've been thinking generally of setting up some kind of communications network.  There are some console-based, stateful nodejs websocket connected chat interfaces.  Could do some chatbots as well.
Makes sense to set up some browser-based React app chat clients.  A Redis database.  
Containerization with Docker/Compose and Kubernetes.

I may come up with a more complex idea as I work on it more.  Sort of improvising as I go.

Cassandra, Redis,




### The React, NodeJS Chat App

This is copied from a quick (2 hour assignment) chat app I did for a job interview (didn't get the job!?) at https://github.com/kulicuu/quick_chat_app


#### Instructions to run this:

- Assuming you have NodeJS, Npm, etc you will install Webpack `npm i -g webpack webpack-cli` and Nodemon `npm i -g nodemon`
- clone and `npm i`
- From directory `React__Client__Zero` run the command `webpack -w`
- From directory `React__Server__Zero` run `nodemon simple.coffee`
- Open a browser to port http://localhost:3003
- Try opening several browser windows to simulate different people chatting.