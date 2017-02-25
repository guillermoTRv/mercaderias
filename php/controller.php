<?php
if(!empty($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest' && isset($_POST['fn'])){
   require_once("fns.php");
   $_POST['fn']();
}else{
   header("Location:../index.php");
}
?>
