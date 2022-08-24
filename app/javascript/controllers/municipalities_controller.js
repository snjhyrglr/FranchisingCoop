import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["municipalitySelect", "input", "output"]
  static values = { showIf: String }

  connect() {
    this.outputTarget.hidden = true
 }

  change(event) {
    let prov_id = event.target.selectedOptions[0].value
    let target = this.municipalitySelectTarget.id

    get(`/provinces/${prov_id}/selected?target=${target}`, {
      responseKind: "turbo-stream"
    })

    if (this.inputTarget.value != this.showIfValue) {
      this.outputTarget.hidden = false
    } else {
      this.outputTarget.hidden = true
    }

    console.log(this.municipalitySelect.value)
  }
}
