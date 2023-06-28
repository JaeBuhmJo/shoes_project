// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily =
  '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = "#292b2c";

createAreaChart(areaChartData);
// createPieChart();

function createAreaChart(data) {
  const keys = Object.keys(data);
  const values = Object.values(data);

  const letMaxY = getMaxY();
  function getMaxY(values) {
    // 데이터셋의 제일 큰 값을 꺼내고, 렝쓰-1로 나눈다음 씨일, 다시 곱하기. 그걸 맥스값으로.
  }
  // Area Chart Example
  var ctx = document.getElementById("myAreaChart");
  var myLineChart = new Chart(ctx, {
    type: "line",
    data: {
      labels: keys,
      datasets: [
        {
          label: "Sessions",
          lineTension: 0.3,
          backgroundColor: "rgba(2,117,216,0.2)",
          borderColor: "rgba(2,117,216,1)",
          pointRadius: 5,
          pointBackgroundColor: "rgba(2,117,216,1)",
          pointBorderColor: "rgba(255,255,255,0.8)",
          pointHoverRadius: 5,
          pointHoverBackgroundColor: "rgba(2,117,216,1)",
          pointHitRadius: 50,
          pointBorderWidth: 2,
          data: values,
        },
      ],
    },
    options: {
      scales: {
        xAxes: [
          {
            time: {
              unit: "date",
            },
            gridLines: {
              display: false,
            },
            ticks: {
              maxTicksLimit: 7,
            },
          },
        ],
        yAxes: [
          {
            ticks: {
              min: 0,
              max: maxY,
              maxTicksLimit: 5,
            },
            gridLines: {
              color: "rgba(0, 0, 0, .125)",
            },
          },
        ],
      },
      legend: {
        display: false,
      },
    },
  });
}

function createPieChart(data) {
  const keys = Object.keys(data);
  const values = Object.values(data);
  // Pie Chart Example
  var ctx = document.getElementById("myPieChart");
  var myPieChart = new Chart(ctx, {
    type: "pie",
    data: {
      labels: keys,
      datasets: [
        {
          data: values,
          backgroundColor: ["#007bff", "#dc3545", "#ffc107", "#28a745"],
        },
      ],
    },
  });
}
