import {
    Controller
} from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["template", "add_item"];

    add_association(event) {
        event.preventDefault();
        var content = "<br>";
        content += this.templateTarget.innerHTML.replace(/TEMPLATE_RECORD/g, Math.floor(Math.random() * 20));
        content += "<br>";
        this.add_itemTarget.insertAdjacentHTML('afterend', content);
    }

    remove_association(event) {
        event.preventDefault();
        let item = event.target.closest(".nested-fields");
        item.querySelector("input[name*='_destroy']").value = 1;
        item.style.display = 'none';
    }

}