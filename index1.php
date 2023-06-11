<?php 
	require_once("include/header.php");
?>
<div id="body">
	<?php include_once("include/left_content.php"); ?>
    <div class="rcontent">
      <h1><span> Hello<?php echo " " . ucfirst($_SESSION['username']); ?></span></h1>
        <div id="contentbox">
            <div id="data">Stats:<br />
            <?php
			$query = "SELECT SUM(total_amount), SUM(profit) FROM buy";
			$moneylist = $connect->query($query);
			$moneylist = $moneylist->fetch_array();
			
			echo "<b>Earnings</b><br />";
			echo "Overall Earnings: Rs. {$moneylist['SUM(total_amount)']}<br /><br />";
			
			echo "<b>Profits</b><br />";
			echo "Overall Profits: Rs. {$moneylist['SUM(profit)']}<br /><br />";
			?>
            </div>
        </div>
    </div>
</div>
<!-- body ends -->
<?php 
	require_once("include/footer.php");
?>
