<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 1/10/2025
  Time: 3:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Lịch Sử Thuê Xe Máy</title>
  <style>
    /* Tổng thể */
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f9f9f9;
      color: #333;
    }

    .container {
      max-width: 800px;
      margin: 20px auto;
      padding: 20px;
      background: #fff;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
    }

    /* Tiêu đề */
    h1 {
      text-align: center;
      margin-bottom: 20px;
      color: #444;
    }

    /* Lịch sử thuê xe */
    .rental-history {
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    /* Mỗi mục thuê xe */
    .rental-item {
      display: flex;
      align-items: center;
      justify-content: space-between;
      border: 1px solid #ddd;
      padding: 15px;
      border-radius: 6px;
      background-color: #fdfdfd;
      transition: box-shadow 0.3s;
    }

    .rental-item:hover {
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }

    /* Hình ảnh xe */
    .rental-item img {
      width: 100px;
      height: 70px;
      object-fit: cover;
      border-radius: 4px;
      margin-right: 20px;
    }

    /* Thông tin xe */
    .rental-details {
      flex: 1;
      display: flex;
      flex-direction: column;
      gap: 5px;
    }

    .rental-details p {
      margin: 0;
      font-size: 14px;
    }

    /* Giá thuê */
    .rental-price {
      font-size: 16px;
      font-weight: bold;
      color: #d9534f;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Lịch Sử Thuê Xe Máy</h1>
  <div class="rental-history">
    <!-- Mục 1 -->
    <div class="rental-item">
      <img src="https://via.placeholder.com/100x70" alt="Yamaha Exciter">
      <div class="rental-details">
        <p><strong>Tên xe:</strong> Yamaha Exciter</p>
        <p><strong>Ngày thuê:</strong> 2024-11-01</p>
        <p><strong>Ngày trả:</strong> 2024-11-05</p>
      </div>
      <div class="rental-price">200,000 VND/ngày</div>
    </div>
    <!-- Mục 2 -->
    <div class="rental-item">
      <img src="https://via.placeholder.com/100x70" alt="Honda Wave Alpha">
      <div class="rental-details">
        <p><strong>Tên xe:</strong> Honda Wave Alpha</p>
        <p><strong>Ngày thuê:</strong> 2024-11-10</p>
        <p><strong>Ngày trả:</strong> 2024-11-12</p>
      </div>
      <div class="rental-price">100,000 VND/ngày</div>
    </div>
    <!-- Mục 3 -->
    <div class="rental-item">
      <img src="https://via.placeholder.com/100x70" alt="Suzuki Raider">
      <div class="rental-details">
        <p><strong>Tên xe:</strong> Suzuki Raider</p>
        <p><strong>Ngày thuê:</strong> 2024-11-15</p>
        <p><strong>Ngày trả:</strong> 2024-11-17</p>
      </div>
      <div class="rental-price">150,000 VND/ngày</div>
    </div>
  </div>
</div>
</body>
</html>

