import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from "chart.js";
Chart.register(...registerables);

export default class extends Controller {
  static values = { data: Object }

  connect() {
    console.log(this.dataValue);
    const ctx = this.element.getContext('2d');
    new Chart(ctx, {
      type: 'bar',
      data: {
        labels: Object.keys(this.dataValue),
        datasets: [{
          label: 'Liczba urodzeń ',
          data: Object.values(this.dataValue),
          backgroundColor: 'rgba(0, 123, 255, 0.5)'
        }]
      }
    });
  }
}


