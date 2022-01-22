// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "channels"

Rails.start()
Turbolinks.start()

// Import the function
import { initSelect2 } from "../plugins/init_select2";

// Call the function
document.addEventListener('turbolinks:load', () => {
  initSelect2();
})
