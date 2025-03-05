// Dữ liệu thống kê từ cơ sở dữ liệu (ví dụ dữ liệu giả)
const labels = ['Honda', 'Yamaha', 'Suzuki', 'Kawasaki', 'Ducati'];
const data = [25, 20, 15, 10, 5];
// Cấu hình biểu đồ
const config = {
    type: 'bar',
    data:{
        labels: labels,
        datasets: [{ label: 'Số lần thuê',
            data: data,
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    },
    options:
        { scales:
                { y: {
                        beginAtZero: true
                    }
                }
        }
}; // Tạo và hiển thị biểu đồ
const ctx = document.getElementById('bikeChart').getContext('2d');
const bikeChart = new Chart(ctx, config);