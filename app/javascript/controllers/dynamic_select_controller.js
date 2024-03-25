import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dynamic-select"
export default class extends Controller {
  // when a new hemigram is created, we need to listen to the change
  connect() {
    this.element.dataset.action = "change->dynamic-select#change"
  }

  // TODO: when the hemigram edit form
  // when there is already a value selected (not 'Select Parameter')
  // and we listen to the change of the second dropdown and show the unit options

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
    // fetch turbo-frame from the select
    const turboFrame = this.element.dataset.turboFrame
    console.log("turboFrame", turboFrame);

    // create new url with the value
    this.url = (`${url}?parameter_select=${value}`)

    // replace the turbo-frame with the new url
    // for the new create form
    let frame = document.querySelector(`turbo-frame#${turboFrame}`)

    frame.src = this.url
    frame.reload()
  }
}
