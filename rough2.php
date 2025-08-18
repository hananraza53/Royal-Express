<!DOCTYPE html>
<html lang="en">
<?php include 'pages/head.php'; ?>
<?php include 'auth.php'; ?>
<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_price'])) {
    $weight = isset($_POST['weight']) ? (int)$_POST['weight'] : 0;
    $km = isset($_POST['km']) ? (int)$_POST['km'] : 10; // default 10 if not provided

    // Simple formula
    $price = 150 + ($weight * 100) + ($km * 50);

    // Put values back into POST so they show in form
    $_POST['total'] = $price;
    $_POST['total_fee'] = $price;
}
?>


<body data-spy="scroll" data-target=".site-navbar-target" data-offset="200">

    <!-- <div class="site-wrap"> -->

    <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
            <div class="site-mobile-menu-close mt-3">
                <span class="icon-close2 js-menu-toggle"></span>
            </div>
        </div>
        <div class="site-mobile-menu-body"></div>
    </div>

    <header class="site-navbar py-3 js-site-navbar site-navbar-target" role="banner" id="site-navbar">

        <div class="container">
            <div class="row align-items-center">

                <div class="col-11 col-xl-2 site-logo">
                    <a href="index.php"><img src="Royal Express Logo.png" alt="" style="max-height: 70px; width: auto;"></a>
                </div>
                <div class="col-12 col-md-10 d-none d-xl-block">
                    <nav class="site-navigation position-relative text-right" role="navigation">

                        <ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
                            <li><a href="index.php#section-home" class="nav-link">Home</a></li>
                            <li>
                                <a href="index.php#section-about" class="nav-link">About Us</a>
                            </li>
                            <li><a href="index.php#section-gallery" class="nav-link">Gallery</a></li>
                            <li><a href="index.php#section-contact" class="nav-link">Contact</a></li>
                            <?php if (isset($_SESSION['customer'])) : ?>
                                <li><a href="profile.php" class="nav-link">Profile</a></li>
                                <li><a href="tracking.php" class="nav-link">Tracking</a></li>
                                <li><a href="admin/logout.php" class="nav-link">Logout</a></li>
                            <?php else : ?>
                                <li><a href="admin/login.php" class="nav-link">Login</a></li>
                            <?php endif; ?>
                            <li><a href="request.php" class="nav-link active">Request</a></li>
                        </ul>
                    </nav>
                </div>


                <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu h3"></span></a></div>

            </div>

        </div>
        </div>

    </header>



    <div class="site-blocks-cover overlay" style=" height: 100px; background-image: url(<?php echo $subheader_src; ?>);" data-aos="fade" data-stellar-background-ratio="0.5" id="section-home">
        <div class="container">
            <div class="row align-items-center justify-content-center text-center">

                <div class="col-md-8" data-aos="fade-up" data-aos-delay="400">


                    <h1 class="text-white font-weight-light text-uppercase font-weight-bold" data-aos="fade-up">REQUEST
                    </h1>

                </div>
            </div>
        </div>
    </div>



    <div class="site-section bg-light" id="section-contact">
        <div class="container">
            <div class="row justify-content-center mb-5">
                <div class="col-md-7 text-center border-primary">
                    <h2 class="font-weight-light text-primary">Make Request</h2>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 mb-5">



                    <form action="#" class="p-5 bg-white" method="post">


                        <h4>Sending Details</h4>
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <div class="row form-group">
                                    <div class="col-md-12 mb-3 mb-md-0">
                                        <label class="text-black" for="send_phone">Phone Number</label>
                                        <input type="text" name="sender_phone" id="sender_phone" class="form-control">
                                    </div>
                                </div>


                            </div>
                            <div class="col-md-6">
                                <div class="row form-group">
    <!-- Weight -->
    <div class="col-md-4">
        <label class="text-black" for="weight">Weight (KG)</label>
        <input type="number" name="weight" id="weight" class="form-control"
            value="<?php echo isset($_POST['weight']) ? $_POST['weight'] : ''; ?>">
    </div>

    <!-- Distance -->
    <div class="col-md-4">
        <label for="distance_km">Distance (KM)</label>
        <input type="number" id="distance_km" name="distance_km" class="form-control" readonly>
    </div>

    <!-- Update Button -->
    <div class="col-md-4 d-flex align-items-end">
        <button type="button" onclick="updatePrice()" 
            class="btn btn-primary py-2 px-4 w-100"
            style="background-color: dark-orange; border: none; border-radius: 4px; color: white;">
            Update
        </button>
    </div>
</div>

                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6">
                                <div class="row form-group">
                                    <div class="col-md-12 mb-3 mb-md-0">
                                        <label class="text-black" for="fname">Sending Location</label>
                                        <select id="send_location" class='form-control norad tx12' name="send_location" type='text'>
                                            <option value="">Please Select</option>
                                            <?php $getall = getAllArea();
                                            while ($row = mysqli_fetch_assoc($getall)) { ?>
                                                <option value="<?php echo $row['area_id'] ?>">
                                                    <?php echo $row['area_name'] ?>
                                                </option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row form-group">
                                    <div class="col-md-12 mb-3 mb-md-0">
                                        <label class="text-black" for="fname">Pick Up Location</label>
                                        <select id="end_location" onchange="calculation(this)" class='form-control norad tx12' name="end_location" type='text'>
                                            <option>Please Select</option>
                                            <?php $getall = getAllArea();
                                            while ($row = mysqli_fetch_assoc($getall)) { ?>
                                                <option value="<?php echo $row['area_id'] ?>">
                                                    <?php echo $row['area_name'] ?>
                                                </option>
                                            <?php } ?>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 mt-5">
                                <div class="row form-group">

                                    <div class="col-md-12">
    <label class="text-black" for="email">Shipping details</label>

    <div class="row">
        <div class="col-md-4">
            Price per KG :
        </div>
        <div class="col-md-8">
            <input type="number" name="price_per_kg" id="price_per_kg" class="form-control"
                   value="100" step="any" min="0" readonly>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-md-4">
            Price per KM :
        </div>
        <div class="col-md-8">
            <input type="number" name="price_per_km" id="price_per_km" class="form-control"
                   value="50" step="any" min="0" readonly>
        </div>
    </div>

    <div class="row mt-2">
        <div class="col-md-4">
            Total Price :
        </div>
        <div class="col-md-8">
            <input type="text" disabled name="total" id="total" class="form-control"
                   value="<?php echo isset($_POST['total']) ? $_POST['total'] : ''; ?>">
            <input type="hidden" name="total_fee" id="total_fee"
                   value="<?php echo isset($_POST['total_fee']) ? $_POST['total_fee'] : ''; ?>">
        </div>
    </div>
</div>

                                </div>
                            </div>
                        </div>

                        
                        <h4 class="mt-5">Receiver Details</h4>
                        <div class="row mt-3">
                            <div class="col-md-6">
                                <div class="row form-group">
                                    <div class="col-md-12 mb-3 mb-md-0">
                                        <label class="text-black" for="res_name">Receiver Name</label>
                                        <input type="text" name="res_name" id="res_name" class="form-control">
                                    </div>
                                </div>


                            </div>
                            <div class="col-md-6">
                                <div class="row form-group">
                                    <div class="col-md-12 mb-3 mb-md-0">
                                        <label class="text-black" for="res_phone">Phone Number</label>
                                        <input type="text" name="res_phone" id="res_phone" class="form-control">
                                    </div>
                                </div>


                            </div>
                        </div>


                        <div class="row form-group">
                            <div class="col-md-12">
                                <label class="text-black" for="red_address">Receiver Address</label>
                                <textarea name="red_address" id="red_address" cols="30" rows="7" class="form-control"></textarea>
                            </div>
                        </div>

                        <div class="row form-group">
                            <div class="col-md-12">
                                <input type="submit" name="submit_request" value="Send Request" class="btn btn-primary py-2 px-4 text-white">

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <?php include 'pages/footer.php'; ?>
    <!-- </div> -->

    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/jquery-migrate-3.0.1.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.stellar.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/bootstrap-datepicker.min.js"></script>
    <script src="js/aos.js"></script>

    <script src="js/main.js"></script>
<!-- jQuery should always load first -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
function updatePrice() {
    var weight = parseFloat($('#weight').val()) || 0;
    var send_location = $('#send_location').val();
    var end_location = $('#end_location').val();
    var price_per_kg = parseFloat($('#price_per_kg').val()) || 100;
    var price_per_km = parseFloat($('#price_per_km').val()) || 50;

    if (weight > 0 && send_location !== "Please Select" && end_location !== "Please Select") {
        $.ajax({
            url: 'calculate_price.php',
            type: 'POST',
            dataType: 'json',
            data: {
                weight: weight,
                send_location: send_location,
                end_location: end_location,
                price_per_kg: price_per_kg,
                price_per_km: price_per_km
            },
            success: function(response) {
    if (response && typeof response.total_price !== 'undefined' && typeof response.distance_km !== 'undefined') {
        $('#distance_km').val(response.distance_km);
        $('#price_per_kg').val(response.price_per_kg);
        $('#price_per_km').val(response.price_per_km);
        $('#total').val(response.total_price);
        $('#total_fee').val(response.total_price);
    } else {
        alert("❌ Invalid response received.");
        $('#distance_km').val('');
        $('#price_per_kg').val('');
        $('#price_per_km').val('');
        $('#total').val('');
        $('#total_fee').val('');
    }
},

            error: function() {
                alert("❌ Error updating price. Please try again.");
                $('#distance_km').val('');
                $('#total').val('');
                $('#total_fee').val('');
            }
        });
    } else {
        $('#distance_km').val('');
        $('#total').val('');
        $('#total_fee').val('');
    }
}


function updateDistance() {
    var send = $('#send_location').val();
    var end = $('#end_location').val();

    if (send !== "Please Select" && end !== "Please Select") {
        // Call updatePrice which will also update distance and price together
        updatePrice();
    } else {
        $('#distance_km').val('');
        $('#total').val('');
        $('#total_fee').val('');
    }
}

// Update distance and price when sending or receiving location changes
$('#send_location, #end_location').change(function() {
    updateDistance();
});

// Update price when weight changes
$('#weight').on('input', function() {
    updatePrice();
});

// On page load, update distance and price if already selected
$(document).ready(function() {
    updateDistance();
});



</script>

</body>

</html>



