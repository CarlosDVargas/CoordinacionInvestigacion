import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
    static targets = ["select", "hidden", "tableRows"];
    static classes = ["hidden"];

    connect() {
        console.log("Connected");
        var option = document.createElement("option");
        option.text = "Seleccione una opción";
        option.selected = true;
        option.disabled = true;
        this.selectTarget.add(option);
        console.log(this.tableRowsTarget.rows[0])
    }

    select() {
        let options = this.selectTarget
        let rows = this.tableRowsTarget.rows
        for (let i = 0; i < rows.length; i++) {
            rows[i].hidden = false;
        }
        rows[options.selectedIndex].hidden = true;
    }
}
