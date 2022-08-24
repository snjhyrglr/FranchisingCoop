import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="showhide"
export default class extends Controller {
  static targets = ["input", "output"]
  static values = { showIf: String }
  connect() {
    this.toggle()
  }

  toggle() {
    if (this.inputTarget.value != this.showIfValue) {
      this.outputTarget.hidden = true
      console.log(this.inputTarget.value)
    } else if (this.inputTarget.value = this.showIfValue) {
      this.outputTarget.hidden = false
      console.log(this.inputTarget.value)
      console.log(this.showIfValue)
    }
  }
}
