new Chart(document.getElementById("lineChart"), {
    type: 'line',
    data: {
        labels: ["2023-09-01","2023-09-02","2023-09-03","2023-09-04","2023-09-05","2023-09-06","2023-09-07","2023-09-08","2023-09-09","2023-09-10","2023-09-11",],
        datasets: [{ 
            data: [24,23,25,24,23,21,20,18,21,23,25,28,15,35],
            label: "BMI",
            borderColor: "#99E1ED",
            fill: false
            }
        ]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                position: 'top',
            },
            title: {
                display: true,
                text: '내 BMI 히스토리'
            }
        }
    }
});