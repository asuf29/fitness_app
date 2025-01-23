import { Controller } from '@hotwired/stimulus';
export default class extends Controller {
  static targets = ['input', 'preview'];

  preview() {
    const input = this.inputTarget;
    const preview = this.previewTarget;

    if (input.files && input.files[0]) {
      const reader = new FileReader();
      reader.onload = (e) => {
        preview.src = e.target.result;
        preview.classList.remove('hidden');
      };
      reader.readAsDataURL(input.files[0]);
    } else {
      preview.classList.add('hidden');
    }
  }
}
