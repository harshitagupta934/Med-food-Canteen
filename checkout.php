<?php

include 'components/connect.php';

session_start();

if(isset($_SESSION['user_id'])){
   $user_id = $_SESSION['user_id'];
}else{
   $user_id = '';
   header('location:home.php');
};

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>checkout</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>
<body>
   
<!-- header section starts  -->
<?php include 'components/user_header.php'; ?>
<!-- header section ends -->

<div class="heading">
   <h3>checkout</h3>
   <p><a href="home.php">home</a> <span> / checkout</span></p>
</div>

<section class="checkout">

   <h1 class="title">order summary</h1>

<form action="" method="post">

   <div class="cart-items">
      <h3>cart items</h3>
      <?php
         $grand_total = 0;
         $cart_items[] = '';
         $select_cart = $conn->prepare("SELECT * FROM `cart` WHERE user_id = ?");
         $select_cart->execute([$user_id]);
         if($select_cart->rowCount() > 0){
            while($fetch_cart = $select_cart->fetch(PDO::FETCH_ASSOC)){
               $cart_items[] = $fetch_cart['name'].' ('.$fetch_cart['price'].' x '. $fetch_cart['quantity'].') - ';
               $total_products = implode($cart_items);
               $grand_total += ($fetch_cart['price'] * $fetch_cart['quantity']);
      ?>
      <p><span class="name"><?= $fetch_cart['name']; ?></span><span class="price">₹<?= $fetch_cart['price']; ?> x <?= $fetch_cart['quantity']; ?></span></p>
      <?php
            }
         }else{
            echo '<p class="empty">your cart is empty!</p>';
         }
      ?>
      <p class="grand-total"><span class="name">Grand total :</span><span class="price">₹<?= $grand_total; ?></span></p>
      <a href="cart.php" class="btn">view cart</a>
   </div>

   <input type="hidden" name="total_products" value="<?= $total_products; ?>">
   <input type="hidden" name="total_price" value="<?= $grand_total; ?>" value="">
   <input type="hidden" name="name" value="<?= $fetch_profile['name'] ?>">
   <input type="hidden" name="number" value="<?= $fetch_profile['number'] ?>">
   <input type="hidden" name="email" value="<?= $fetch_profile['email'] ?>">
   <input type="hidden" name="address" value="<?= $fetch_profile['address'] ?>">

   <div class="user-info">
      <h3>your info</h3>
      <p><i class="fas fa-user"></i><span><?= $fetch_profile['name'] ?></span></p>
      <p><i class="fas fa-phone"></i><span><?= $fetch_profile['number'] ?></span></p>
      <p><i class="fas fa-envelope"></i><span><?= $fetch_profile['email'] ?></span></p>
      <a href="update_profile.php" class="btn">update info</a>
      <h3>delivery address</h3>
      <p><i class="fas fa-map-marker-alt"></i><span><?php if($fetch_profile['address'] == ''){echo 'please enter your address';}else{echo $fetch_profile['address'];} ?></span></p>
      <a href="update_address.php" class="btn">update address</a>
      <select name="method" class="box" required>
         <option value="" disabled selected>select payment method --</option>
         <option value="cash on delivery">cash on delivery</option>
         <option value="Razorpay">Razorpay</option>
       
      </select>
      <input type="submit" value="place order" class="btn <?php if($fetch_profile['address'] == ''){echo 'disabled';} ?>" style="width:100%; background:var(--red); color:var(--white);" name="submit">
   </div>
a
</form>

</section>

<!-- footer section starts  -->
<?php include 'components/footer.php'; ?>
<!-- footer section ends -->

<!-- custom js file link  -->
<script src="js/script.js"></script>

<!-- Razorpay payment script -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
    $(document).ready(function() {
        $('form').submit(function(event) {
            var paymentMethod = $('[name="method"]').val(); // Get selected payment method
            event.preventDefault(); // Prevent default form submission
            
            if (paymentMethod === 'Razorpay') {
                var formData = $(this).serialize(); // Serialize form data
                var amt = $('[name="total_price"]').val();
                var options = {
                    "key": "rzp_test_gpdEuRJERzXOGG",
                    "amount": amt * 100,
                    "currency": "INR",
                    "name": "Medicap",
                    "description": "Test Transaction",
                    "image": "https://image.freepik.com/free-vector/logo-sample-text_355-558.jpg",
                    "handler": function(response) {
                        console.log(response);
                        // Include payment ID and form data in the AJAX request
                        formData += "&payment_id=" + response.razorpay_payment_id;
                        $.ajax({
                            type: 'post',
                            url: 'payment_process.php',
                            data: formData,
                            success: function(result) {
                                console.log(result);
                                // Redirect or show success message
                                window.location.href = "orders.php";
                            }
                        });
                    }
                };
            } else if (paymentMethod === 'cash on delivery') {
                var formData = $(this).serialize(); // Serialize form data
                formData += "&payment_id=cash on delivery"; // Set payment ID for cash on delivery
                $.ajax({
                    type: 'post',
                    url: 'payment_process.php',
                    data: formData,
                    success: function(result) {
                        console.log(result);
                        // Redirect or show success message
                        window.location.href = "orders.php";
                    }
                });
                return; // Exit the function after processing cash on delivery
            }
            var rzp1 = new Razorpay(options);
            rzp1.open();
        });
    });
</script>

</script>

</body>
</html>
