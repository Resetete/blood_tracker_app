// thats a stimulus controller to ensure that flash messages div containers are
// are removed from the DOM if they are empty (fade-out animation doesnt remove the div)
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="removals"
export default class extends Controller {
  remove() {
    this.element.remove()
  }
}
