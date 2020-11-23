$(document).ready(function() {
    function call_ajax() {
        return $.ajax({
            url: 'charts_funcionarios',
            type: 'GET',
            dataType: 'json',
        });
    }

    $.when(call_ajax()).done(function(data) {
        var vendaArray = [];
        var clienteArray = [];
        for (var i in data) {
            vendaArray.push(data[i].valor);
            clienteArray.push(data[i].cliente.nome)
            
        }
        grafico(vendaArray, clienteArray)
    });


});

function grafico(vendas, cliente){
    var ctx = document.getElementById('myChart').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: cliente,
            datasets: [{
                label: 'Valor do Contrato',
                data: vendas,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
}