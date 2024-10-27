<%-- 
    Document   : payments
    Created on : 21-Oct-2024, 11:28:01 am
    Author     : 91989
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eventura - Payments</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .payment-options {
            margin-bottom: 20px;
        }

        .payment-option {
            display: flex;
            align-items: center;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        .payment-option img {
            width: 100px;
            height: 70px;
            margin-right: 15px;
        }

        .book-now {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .book-now:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Select Payment Method</h1>

    <form id="payment-form" action="event_ticket" method="post" target="_blank" onsubmit="return bookTicket()">
        <div class="payment-options">
            
            <input type="hidden" name="eventId" value="<%= request.getParameter("eventId") %>">
            <label class="payment-option">
                <input type="radio" name="payment" value="Google Pay" onclick="selectPayment('Google Pay')">
                <img src="images/gpay.avif" alt="Google Pay">
                <span>Google Pay</span>
            </label>

            <label class="payment-option">
                <input type="radio" name="payment" value="PhonePe" onclick="selectPayment('PhonePe')">
                <img src="images/phonepe.png" alt="PhonePe">
                <span>PhonePe</span>
            </label>

            <label class="payment-option">
                <input type="radio" name="payment" value="Paytm" onclick="selectPayment('Paytm')">
                <img src="images/paytm.jpg" alt="Paytm">
                <span>Paytm</span>
            </label>

            <label class="payment-option">
                <input type="radio" name="payment" value="Credit/Debit Card" onclick="selectPayment('Credit/Debit Card')">
                <img src="images/credit.png" alt="Credit/Debit Card">
                <span>Credit/Debit Card</span>
            </label>

            <label class="payment-option">
                <input type="radio" name="payment" value="Net Banking" onclick="selectPayment('Net Banking')">
                <img src="images/netbanking.webp" alt="Net Banking">
                <span>Net Banking</span>
            </label>
        </div>
        
        <button type="submit" class="book-now">Book Now</button>
    </form>

    <p id="confirmation" style="color: green; font-weight: bold; text-align: center; display: none;">Ticket booked successfully using <span id="selected-payment"></span>!</p>
</div>

<script>
    let selectedPaymentMethod = '';

    function selectPayment(method) {
        selectedPaymentMethod = method;
    }

    function bookTicket() {
        const selectedOption = document.querySelector('input[name="payment"]:checked');
        if (!selectedOption) {
            alert("Please select a payment method before booking.");
            return false; // Prevent form submission
        } else {
            document.getElementById('selected-payment').innerText = selectedPaymentMethod;
            document.getElementById('confirmation').style.display = 'block';
            return true; // Allow form submission
        }
    }
</script>

</body>
</html>
