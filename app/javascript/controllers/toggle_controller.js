import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "list" ]

  toggle(e) {
    // console.log(e.currentTarget.id)
    if (e.currentTarget.id == "transactional_mailer_form_role_movie_director" && e.currentTarget.checked == true ){
      this.listTarget.classList.remove("element-toggle")
    } else {
      this.listTarget.classList.add("element-toggle")
    }
  }
}
