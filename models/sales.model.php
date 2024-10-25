<?php

require_once 'connection.php';


class ModelSales{
	/*=============================================
	SHOWING SALES
	=============================================*/
	/* --Web Engineering Project By 21CS050,21CS072,21CS078 -- */

	static public function mdlShowSales($table, $item, $value){

		$connection = new Connection();
		if($item != null){

			$stmt = $connection->connect()->prepare("SELECT * FROM $table WHERE $item = :$item ORDER BY id ASC");

			$stmt -> bindParam(":".$item, $value, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetch();

		}else{

			$stmt = $connection->connect()->prepare("SELECT * FROM $table ORDER BY id ASC");

			$stmt -> execute();

			return $stmt -> fetchAll();

		}

		$stmt -> close();

		$stmt = null;

	}

	/*=============================================
	REGISTERING SALE
	=============================================*/
	/* --Web Engineering Project By 21CS050,21CS072,21CS078 -- */
	static public function mdlAddSale($table, $data){

		
		$connection = new Connection();
		$stmt = $connection->connect()->prepare("INSERT INTO $table(code, idCustomer, idSeller, products, tax, netPrice, totalPrice, paymentMethod) VALUES (:code, :idCustomer, :idSeller, :products, :tax, :netPrice, :totalPrice, :paymentMethod)");

		$stmt->bindParam(":code", $data["code"], PDO::PARAM_INT);
		$stmt->bindParam(":idCustomer", $data["idCustomer"], PDO::PARAM_INT);
		$stmt->bindParam(":idSeller", $data["idSeller"], PDO::PARAM_INT);
		$stmt->bindParam(":products", $data["products"], PDO::PARAM_STR);
		$stmt->bindParam(":tax", $data["tax"], PDO::PARAM_STR);
		$stmt->bindParam(":netPrice", $data["netPrice"], PDO::PARAM_STR);
		$stmt->bindParam(":totalPrice", $data["totalPrice"], PDO::PARAM_STR);
		$stmt->bindParam(":paymentMethod", $data["paymentMethod"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		$stmt->close();
		$stmt = null;

	}
	/* --Web Engineering Project By 21CS050,21CS072,21CS078 -- */
	/*=============================================
	EDIT SALE
	=============================================*/
	
	static public function mdlEditSale($table, $data){

		
		$connection = new Connection();
		$stmt = $connection->connect()->prepare("UPDATE $table SET  idCustomer = :idCustomer, idSeller = :idSeller, products = :products, tax = :tax, netPrice = :netPrice, totalPrice= :totalPrice, paymentMethod = :paymentMethod WHERE code = :code");

		$stmt->bindParam(":code", $data["code"], PDO::PARAM_INT);
		$stmt->bindParam(":idCustomer", $data["idCustomer"], PDO::PARAM_INT);
		$stmt->bindParam(":idSeller", $data["idSeller"], PDO::PARAM_INT);
		$stmt->bindParam(":products", $data["products"], PDO::PARAM_STR);
		$stmt->bindParam(":tax", $data["tax"], PDO::PARAM_STR);
		$stmt->bindParam(":netPrice", $data["netPrice"], PDO::PARAM_STR);
		$stmt->bindParam(":totalPrice", $data["totalPrice"], PDO::PARAM_STR);
		$stmt->bindParam(":paymentMethod", $data["paymentMethod"], PDO::PARAM_STR);

		if($stmt->execute()){

			return "ok";

		}else{

			return "error";
		
		}

		$stmt->close();
		$stmt = null;

	}
	/* --Web Engineering Project By 21CS050,21CS072,21CS078 -- */
	/*=============================================
	DELETE SALE
	=============================================*/

	static public function mdlDeleteSale($table, $data){
		
		$connection = new Connection();

		$stmt = $connection->connect()->prepare("DELETE FROM $table WHERE id = :id");

		$stmt -> bindParam(":id", $data, PDO::PARAM_INT);

		if($stmt -> execute()){

			return "ok";
		
		}else{

			return "error";	

		}

		$stmt -> close();

		$stmt = null;

	}
	/* --Web Engineering Project By 21CS050,21CS072,21CS078 -- */
	/*=============================================
	DATES RANGE
	=============================================*/	

	static public function mdlSalesDatesRange($table, $initialDate, $finalDate){

		$connection = new Connection();
		if($initialDate == null){

			$stmt = $connection->connect()->prepare("SELECT * FROM $table ORDER BY id ASC");

			$stmt -> execute();

			return $stmt -> fetchAll();	


		}else if($initialDate == $finalDate){

			$stmt = $connection->connect()->prepare("SELECT * FROM $table WHERE saledate like '%$finalDate%'");

			$stmt -> bindParam(":saledate", $finalDate, PDO::PARAM_STR);

			$stmt -> execute();

			return $stmt -> fetchAll();

		}else{

			$actualDate = new DateTime();
			$actualDate ->add(new DateInterval("P1D"));
			$actualDatePlusOne = $actualDate->format("Y-m-d");

			$finalDate2 = new DateTime($finalDate);
			$finalDate2 ->add(new DateInterval("P1D"));
			$finalDatePlusOne = $finalDate2->format("Y-m-d");

			if($finalDatePlusOne == $actualDatePlusOne){

				$stmt = $connection->connect()->prepare("SELECT * FROM $table WHERE saledate BETWEEN '$initialDate' AND '$finalDatePlusOne'");

			}else{


				$stmt = $connection->connect()->prepare("SELECT * FROM $table WHERE saledate BETWEEN '$initialDate' AND '$finalDate'");

			}
		
			$stmt -> execute();

			return $stmt -> fetchAll();

		}

	}

	/* --Web Engineering Project By 21CS050,21CS072,21CS078 -- */
	/*=============================================
	Adding TOTAL sales
	=============================================*/

	static public function mdlAddingTotalSales($table){	

		$connection = new Connection();
		$stmt = $connection->connect()->prepare("SELECT SUM(netPrice) as total FROM $table");

		$stmt -> execute();

		return $stmt -> fetch();

		$stmt -> close();

		$stmt = null;

	}
}