<!DOCTYPE html>
<html>
<body>

<h1>projcet 1A </h1>

<?php
echo "Implemented by Kaiyuan Xu and Yao Xie, 2018";
echo "</br>";
echo "Please type an expression including operators and numbers";
echo "</br>";
echo "</br>";
echo "</br>";
?>

<form method="post" action="<?php echo $_SERVER['PHP_SELF'];?>">
  Input: <input type="text" name="fname">
  <input type="submit">
</form>

<?php

function calc(&$num_arr, &$op_arr){
    if (count($num_arr)>0){
        $num1 = array_pop($num_arr);
        $num2 = array_pop($num_arr);
        $op = array_pop($op_arr);
        if ($op=='*') $re = $num1*$num2;
        if ($op=='/') $re = $num2/$num1;// 这里注意顺序，栈是先进后出，所以$num2是被除数
        if ($op=='+') $re = $num2+$num1;
        if ($op=='-') $re = $num2-$num1;
        array_push($num_arr, $re);
    }
}

function priority($str){
    if ($str == '*' || $str == '/'){
        return 1;
    } else {
        return 0;
    }
}

function isOper($oper){
    $oper_array = array('+','-','*','/');
    if (in_array($oper, $oper_array)){
        return true;
    }
    return false;
}


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // collect value of input field
    $name = $_POST['fname']; 
    if (empty($name)) {
        echo "No inputs";
    } else {

        $num_arr = array();
        $op_arr = array();

        $tmp = $name;

        preg_match_all('/./', $tmp, $arr);
        $str_arr = $arr[0];

        $length = count($str_arr);
        $pre_num = '';
        for($i=0; $i<$length; $i++){
            $val = $str_arr[$i];
    // 数字
            if (is_numeric($val)){
                $pre_num .= $val;// 兼顾下一个字符可能也是数字的情况（多位数）
                if($i+1>=$length || isOper($str_arr[$i+1])){// 下一个是运算符或者到头了，则把数字塞进数字栈
                    array_push($num_arr, $pre_num);
                    $pre_num = '';
                }
    // 符号判断优先级，选择是否入栈
            } else if (isOper($val)){
                if (count($op_arr)>0){
            // 判断优先级，只要不大于符号栈顶的优先级，就开始计算，直到优先级大于了栈顶的，计算后才再把这个运算符入栈
                    while (end($op_arr) && priority($val) <= priority(end($op_arr))){
                        calc($num_arr, $op_arr);
                    }
                }
                array_push($op_arr, $val);
            }
        }

        while(count($num_arr)>0){
            calc($num_arr, $op_arr);
            if (count($num_arr)==1){
                $result = array_pop($num_arr);
                break;
            }
        }

        echo $str, $result;



        //$x = $arr[0][1];
        //echo $x;

    	/*

    	if(preg_match('/\*', $tmp, $matches, PREG_OFFSET_CAPTURE))
    	{
    		
    		$index_sub = $matches[0][1];

    		//echo($index_sub);
    		echo(substr($name, 0, $index_sub));
    	}
*/
    	
    	
		
        
    }
}
?>

</body>
</html>