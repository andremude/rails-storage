import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import { initMapbox } from '../plugins/init_mapbox'
import { Application } from 'stimulus'
import { definitionsFromContext } from 'stimulus/webpack-helpers'
import Flatpickr from 'stimulus-flatpickr'
require("flatpickr/dist/flatpickr.css")
import {initFlatpickr} from '../plugins/init_flatpickr'
import {jquery} from 'jquery'

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', () => {
  initFlatpickr();
  initMapbox();
})

// document.addEventListener('turbolinks:load', () => {
  // initMapbox();
// })

const application = Application.start()
const context = require.context('../controllers', true, /\.js$/)
application.load(definitionsFromContext(context))

application.register('flatpickr', Flatpickr)
