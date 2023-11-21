<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="orderNow" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Select Mode of Payment, So We Redirect You To Payment Gateway</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      
      <div class="modal-body">
      
    <div class="custom-control custom-radio">
  		<input type="radio" id="customRadio1" name="customRadio" class="custom-control-input">
  		<label class="custom-control-label" for="customRadio1">UPI</label>
	</div>

	<div class="custom-control custom-radio">
  		<input type="radio" id="customRadio2" name="customRadio" class="custom-control-input">
  		<label class="custom-control-label" for="customRadio2">Paytm</label>
	</div>
	  
	<div class="custom-control custom-radio">
  		<input type="radio" id="customRadio3" name="customRadio" class="custom-control-input">
  		<label class="custom-control-label" for="customRadio3">Debit Card/Credit Card</label>
	</div>
	 
	<div class="custom-control custom-radio">
  		<input type="radio" id="customRadio4" name="customRadio" class="custom-control-input">
  		<label class="custom-control-label" for="customRadio4">Net Banking</label>
	</div>
	
	<div class="custom-control custom-radio">
  		<input type="radio" id="customRadio5" name="customRadio" class="custom-control-input">
  		<label class="custom-control-label" for="customRadio5">COD</label>
	</div>
	 
	  
      </div>
      

      
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-dismiss="modal" onclick="showToast('Your order has been placed successfully!!')">Place Order</button>
      </div>
    </div>
  </div>
</div>

<!-- This div is used to give toast message -->
<div id="toast"></div>

</body>
</html>