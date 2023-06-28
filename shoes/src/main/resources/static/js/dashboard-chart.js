// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = "#292b2c";

fetch("/dashboard/areachart")
  .then((response) => {
    if (!response.ok) {
      throw new Error("영역차트 데이터 불러오기 실패");
    }
    return response.json();
  })
  .then((data) => {
    createAreaChart(data);
  })
  .catch((error) => console.log(error));

function createAreaChart(data) {
  const keys = Object.keys(data);
  const values = Object.values(data);

  // 가장 높은 범주값 : 가장 큰 데이터값의 맨 앞자리수로 올림
  const maxValue = Math.max(...values);
  const valueScale = Math.pow(10, maxValue.toString().length - 1);
  let maxY = Math.ceil((maxValue * 1.0) / valueScale) * valueScale;

  var ctx = document.getElementById("myAreaChart");
  var myAreaChart = new Chart(ctx, {
    type: "line",
    data: {
      labels: keys,
      datasets: [
        {
          label: "매출액",
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
