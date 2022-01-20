// app/javascript/controllers/typed_js_controller.js
import { Controller } from "@hotwired/stimulus"

import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["DISCOVER ALL THE VHS", "YOU DREAMED ABOUT..."],
      typeSpeed: 100,
      loop: true
    });
  }
}
