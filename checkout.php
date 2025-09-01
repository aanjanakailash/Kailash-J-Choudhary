<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Checkout - AgroStore</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #e3f2fd;
      margin: 0;
      padding: 0;
    }
    .container {
      width: 80%;
      margin: 20px auto;
      display: flex;
      justify-content: space-between;
    }
    .section {
      width: 60%;
      padding: 20px;
      background: #fff;
      border-radius: 8px;
      box-shadow: 0px 2px 6px rgba(0,0,0,0.1);
    }
    .order-summary {
      width: 35%;
      padding: 20px;
      background: #fff;
      border-radius: 8px;
      box-shadow: 0px 2px 6px rgba(0,0,0,0.1);
    }
    h3 {
      margin-top: 0;
      font-size: 18px;
      color: #333;
    }
    .radio-group {
      margin: 10px 0;
    }
    .radio-group label {
      margin-left: 8px;
    }
    .btn {
      padding: 10px 20px;
      background: #4caf50;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      margin-top: 15px;
    }
    .btn:hover {
      background: #45a049;
    }
  </style>
</head>
<body>

<div class="container">

  <!-- Payment Info -->
  <div class="section">
    <h3>Payment Information</h3>
    <div class="radio-group">
      <input type="radio" name="payment" id="cod" value="cod">
      <label for="cod">Cash on Delivery (COD)</label>
    </div>
    <div class="radio-group">
      <input type="radio" name="payment" id="netbanking" value="netbanking">
      <label for="netbanking">Net Banking / UPI / Card</label>
    </div>

    <button class="btn" id="cod-submit">Submit COD Order</button>
  </div>

  <!-- Order Summary -->
  <div class="order-summary">
    <h3>Your Order</h3>
    <p>Bloom Buddy</p>
    <p><strong>₹899</strong></p>
    <hr>
    <p><strong>Order Total: ₹899</strong></p>
  </div>

</div>

<!-- Razorpay Script -->
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
  // Razorpay options
  var options = {
    "key": "YOUR_KEY_ID", // 🔴 Replace with your Razorpay Key ID
    "amount": 89900, // Paisa me (₹899 * 100)
    "currency": "INR",
    "name": "AgroStore",
    "description": "Purchase - Bloom Buddy",
    "image": "https://yourwebsite.com/logo.png", // optional
    "handler": function (response){
        alert("✅ Payment Successful!\nPayment ID: " + response.razorpay_payment_id);
        // TODO: AJAX se PHP ko call karo aur DB me order update karo
    },
    "theme": {
        "color": "#3399cc"
    },
    "method": {
        upi: true,
        netbanking: true,
        card: true,
        wallet: true
    }
  };
  var rzp1 = new Razorpay(options);

  // Netbanking radio click → Razorpay open
  document.getElementById('netbanking').addEventListener('click', function(){
      rzp1.open();
  });

  // COD button submit
  document.getElementById('cod-submit').addEventListener('click', function(){
      if(document.getElementById('cod').checked){
          alert("✅ COD Order Placed Successfully!");
          // TODO: COD order ko PHP me save karo
      } else {
          alert("⚠️ Please select Cash on Delivery option first.");
      }
  });
</script>

</body>
</html>
