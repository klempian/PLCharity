// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: Object.keys(chartData),
    datasets: [{
      data: Object.keys(chartData).map(function (key) {
        return chartData[key];
      }),
      backgroundColor: ['#E74C3C', '#8E44AD', '#3498DB', '#2ECC71', '#F1C40F'],
      hoverBackgroundColor: ['#C0392B', '#9B59B6', '#2980B9', '#27AE60', '#F39C12'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    // legendCallBack: function(myPieChart) {
    //   var text = [];
    //   for (var i=0; i<myPieChart.data.datasets[0].data.length; i++) {
    //     text.push('<span class="mr-2">');
    //     text.push('<i class="fas fa-circle" style="background-color:' + myPieChart.data.datasets[0].backgroundColor[i] + '"></i>' + myPieChart.data.datasets[0].data[i]);
    //     if (myPieChart.data.labels[i]) {
    //       text.push(myPieChart.data.labels[i]);
    //     }
    //     text.push('</span>');
    //   }
    //   return text.join("");
    // },
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false,
    },
    cutoutPercentage: 80,
  //   legendCallback: function(chart) {
  //     var div = document.createElement('div');
  //     div.className = "mt-4 text-center small";
  //     // var borderColor = chart.data.datasets[0].borderColor;
  //     chart.data.labels.forEach(function(label, index) {
  //       div.innerHTML += `
  //           	<span class="mr-2">
  //           	<i class="fas fa-circle"></i>
  //                 ${label}
  //              </span>
  //           `; // ^ ES6 Template String
  //     });
  //     return div.outerHTML;
  //   }
  },

});

$("#chartLegend").html(myPieChart.generateLegend());
