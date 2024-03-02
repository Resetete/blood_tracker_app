import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dynamic-select"
export default class extends Controller {
  connect() {
    this.element.dataset.action = "change->dynamic-select#change"
  }

  change() {
    // Check if the first dropdown has a selected value
    const firstDropdown = document.getElementById('parameter-select');
    const firstDropdownValue = firstDropdown.value;

    if (!firstDropdownValue) {
      // Insert the error message below the second dropdown
      const errorMessageDiv = document.getElementById('unit-selector');
      errorMessageDiv.className = 'dependent-select-error-message';
      errorMessageDiv.innerText = 'Please select a parameter first.';

      return;
    }

    // get value of the select
    const value = this.element.value
    // get data-url from the select
    const url = this.element.dataset.url
    // fetch turbo-type from the select
    const turboFrame = this.element.dataset.turboFrame

    // create new url with the value
    this.url = (`${url}?parameter_select=${value}`)

    // replace the turbo-frame with the new url
    let frame = document.querySelector(`turbo-frame#${turboFrame}`)
    frame.src = this.url
    frame.reload()
  }
}
