import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
    static targets = ["select", "hidden", "tableRows"];
    static classes = ["hidden"];

    connect() {
        var option = document.createElement("option");
        option.text = "Seleccione una opción";
        option.selected = true;
        option.disabled = true;
        this.selectTarget.add(option);
    }

    select() {
        let options = this.selectTarget
        let rows = this.tableRowsTarget.rows
        let selectedOptionIndex = options.selectedIndex
        for (let i = 0; i < rows.length; i++) {
            rows[i].hidden = false;
        }
        rows[selectedOptionIndex].hidden = true;
        rows[selectedOptionIndex].cells[4].getElementsByClassName("project_investigators")[0].checked = false;
    }
}
