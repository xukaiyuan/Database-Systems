<form name="reg_testdate" action="payment.php" method="post">
  <!-- 支付宝/财付通/网银在线支付 -->
   <div><input type="radio" name="AorD"
          	  <?php if (isset($AorD) && $AorD=="Actor") echo "checked";?>
          	value="Actor" onclick="otherpays()">Actor
          	<input type="radio" name="AorD"
          		<?php if (isset($AorD) && $AorD=="Director") echo "checked";?>
          	value="Director" onclick="predeposit()">Director
          	<br><br></div>
   <div>
     <ul>
       <li><input type="radio" id='otherpayment' name="i"
          		<?php if (isset($gender) && $gender=="Female") echo "checked";?>
          	value="Female">Female
          	<input type="radio" id='otherpayment' name="j"
          		<?php if (isset($gender) && $gender=="Male") echo "checked";?>
          	value="Male">Male
          </span></li>
     </ul>
   </div>
  
</form>

<script type='text/javascript'>
/*点击使用余额支付*/
function predeposit(){
        document.reg_testdate.otherpayment[0].disabled=true;
        document.reg_testdate.otherpayment[1].disabled=true;
      document.reg_testdate.otherpayment.checked=false;
  }
/*点击使用网银支付*/
function otherpays(){
        document.reg_testdate.otherpayment[0].disabled=false;
        document.reg_testdate.otherpayment[1].disabled=false;
      document.reg_testdate.otherpayment.checked=true;
  }
</script>