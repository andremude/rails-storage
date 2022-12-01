import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"
import { initMapbox } from '../plugins/init_mapbox'
import {initFlatpickr} from '../plugins/init_flatpickr'
require("flatpickr/dist/flatpickr.css")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', () => {
  initFlatpickr();
  initMapbox();
})
