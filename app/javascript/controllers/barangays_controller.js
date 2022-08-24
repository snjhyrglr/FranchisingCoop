import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["barangaySelect"]

  change(event) {
    let mun_id = event.target.selectedOptions[0].value
    let target = this.barangaySelectTarget.id

    get(`/municipalities/${mun_id}/selected?target=${target}`, {
      responseKind: "turbo-stream"
    })
  }
}
