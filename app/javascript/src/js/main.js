import Turbo from "@hotwired/turbo"
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

import * as bootstrap from "bootstrap"

const application = Application.start()
const context = require.context("./controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

window.addEventListener("load", function() {
    console.log('Hello World from Webpacker (main.js)')
    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl)
    })
})