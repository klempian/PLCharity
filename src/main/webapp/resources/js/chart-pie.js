var configd = {
    type: 'doughnut',
    data: {
        labels: Object.keys(chartData),
        datasets: [{
            data: Object.keys(chartData).map(function (key) {
                return chartData[key];
            }),
            backgroundColor: ['#E74C3C', '#8E44AD', '#3498DB', '#2ECC71', '#F1C40F', '#f56565', '#f6ad55', '#9ae6b4', '#81e6d9', '#90cdf4', '#b794f4', '#fbb6ce'],
            hoverBackgroundColor: ['#C0392B', '#9B59B6', '#2980B9', '#27AE60', '#F39C12', '#e53e3e', '#ed8936', '#68d391', '#4fd1c5', '#63b3ed', '#9f7aea', '#f687b3'],
            hoverBorderColor: "rgba(234, 236, 244, 1)",
        }],
    },
    options: {
        responsive: true,
        legend: {
            display: false
        },
        legendCallback: function (chart) {
            console.log(chart.data.datasets);
            var text = [];
            for (var i = 0; i < chart.data.datasets[0].data.length; i++) {
                text.push('<i class="fas fa-circle" style="color:' + chart.data.datasets[0].backgroundColor[i] + '"></i> <span id="legend-' + i + '-item" class="mr-2"   onclick="updateDataset(event, ' + '\'' + i + '\'' + ')">');
                if (chart.data.labels[i]) {
                    text.push(chart.data.labels[i]);
                }
                text.push('</span>');
            }
            return text.join("");
        },
        title: {
            display: false,
            text: 'Chart.js Doughnut Chart'
        },
        animation: {
            animateScale: true,
            animateRotate: true
        },
        tooltips: {
            mode: 'index',
            intersect: false,
        },
        maintainAspectRatio: false,

    }
};

var ctxd = document.getElementById('myPieChart').getContext('2d');

window.myDoughnut = new Chart(ctxd, configd);
$("#chartLegend").html(window.myDoughnut.generateLegend());

// Show/hide chart by click legend
updateDataset = function (e, datasetIndex) {
    var index = datasetIndex;
    var ci = e.view.myDoughnut;
    var meta = ci.getDatasetMeta(0);
    var result= (meta.data[datasetIndex].hidden == true) ? false : true;
    if(result==true)
    {
        meta.data[datasetIndex].hidden = true;
        $('#' + e.path[0].id).css("text-decoration", "line-through");
    }else{
        $('#' + e.path[0].id).css("text-decoration","");
        meta.data[datasetIndex].hidden = false;
    }

    ci.update();
};