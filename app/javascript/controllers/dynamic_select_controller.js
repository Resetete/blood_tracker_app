import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dynamic-select"
export default class extends Controller {
  // when a new hemigram is created, we need to listen to the change
  connect() {
    this.element.dataset.action = "change->dynamic-select#change"
  }

  // New and edit form
  // when there is already a value selected (not 'Select Parameter')
  // and we listen to the change of the second dropdown and show the unit options
  // each form needs dynamic dropdown select ids so that the javascript works specifically for each dropdown

  change() {
    // Check if the first dropdown has a selected value
    const objectId = this.element.dataset.objectId || this.context.parentElement.id.split('-').pop()

    let firstDropdownValue;
    let firstDropdown;

    if (objectId) {
      const parameterSelector = 'parameter-select-' + objectId;
      firstDropdown = document.getElementById(parameterSelector);
      // If possible get the value of the first Parameter select dropdown
      firstDropdownValue = firstDropdown?.value;
    }

    if (!firstDropdownValue) {
      // Insert an error message below the second dropdown
      const errorMessageDiv = document.getElementById('unit-selector');
      errorMessageDiv.className = 'dependent-select-error-message';
      errorMessageDiv.innerText = 'Please select a parameter first.';

      return;
    }

    // TODO: for the edit form
    // need to update the abbreviations

    // get value of the parameter select
    const value = this.element.value
    // get data-url from the select
    const url = this.element.dataset.url
    // fetch turbo-frame from the select
    const turboFrameId = this.element.dataset.turboFrame + '-' + objectId
    console.log('this.element.dataset.turboFrame', this.element.dataset.turboFrame);
    console.log("turboFrame", turboFrameId);

    // create new url with the value
    // the values are passed to the controller action as params
    this.url = (`${url}?parameter_select=${value}&hemigram_id=${objectId}`)

    // replace the turbo-frame with the new url
    // for the new create form
    let frame = document.querySelector(`turbo-frame#${turboFrameId}`)
    console.log('frame', frame);

    // We do not reload the frame in the edit form
    // if (frame) {
      frame.src = this.url
      frame.reload()
    // }
  }
}
