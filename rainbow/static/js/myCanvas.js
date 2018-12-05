var initPieChart = function() {
    $('.percentage-light').easyPieChart({
        barColor: '#ff8a5c',
        trackColor: '#666',
        scaleColor: false,
        lineCap: 'butt',
        lineWidth: 8,
        animate: 1000
    });

    $('.percentage-light').each(function() {
        var num = ['95','96','97','98','99','100','97','98','99','95','96'];
        var newnum = Math.round(10*Math.random())-1;
         var newValue = num[newnum];
        $(this).data('easyPieChart').update(newValue);
        $('span', this).text(newValue);
    });
};