<?php


require_once "connection.php";



class CategoriesModel {

    public function mdlAddCategory($table, $data) {
        $connection = new Connection(); // Create an instance
        $stmt = $connection->connect()->prepare("INSERT INTO $table(category) VALUES (:category)");

        $stmt->bindParam(":category", $data, PDO::PARAM_STR);

        if ($stmt->execute()) {
            return 'ok';
        } else {
            return 'error';
        }

        $stmt->close();
        $stmt = null;
    }

    static public function mdlShowCategories($table, $item, $value) {
        $connection = new Connection(); // Create an instance
        if ($item != null) {
            $stmt = $connection->connect()->prepare("SELECT * FROM $table WHERE $item = :$item");

            $stmt->bindParam(":" . $item, $value, PDO::PARAM_STR);

            $stmt->execute();

            return $stmt->fetch();
        } else {
            $stmt = $connection->connect()->prepare("SELECT * FROM $table");

            $stmt->execute();

            return $stmt->fetchAll();
        }

        $stmt->close();
        $stmt = null;
    }

    static public function mdlEditCategory($table, $data) {
        $connection = new Connection(); // Create an instance
        $stmt = $connection->connect()->prepare("UPDATE $table SET Category = :Category WHERE id = :id");

        $stmt->bindParam(":Category", $data["Category"], PDO::PARAM_STR);
        $stmt->bindParam(":id", $data["id"], PDO::PARAM_INT);

        if ($stmt->execute()) {
            return "ok";
        } else {
            return "error";
        }

        $stmt->close();
        $stmt = null;
    }

    static public function mdlDeleteCategory($table, $data) {
        $connection = new Connection(); // Create an instance
        $stmt = $connection->connect()->prepare("DELETE FROM $table WHERE id = :id");

        $stmt->bindParam(":id", $data, PDO::PARAM_INT);

        if ($stmt->execute()) {
            return "ok";
        } else {
            return "error";
        }

        $stmt->close();
        $stmt = null;
    }
}
