<?php
function get_products_by_category($category_id) {
    global $db;
    $query = '
        SELECT *
        FROM products p
           INNER JOIN categories c
           ON p.categoryID = c.categoryID
        WHERE p.categoryID = :category_id';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue(':category_id', $category_id);
        $statement->execute();
        $result = $statement->fetchAll();
        $statement->closeCursor();
        return $result;
    } catch (PDOException $e) {
        $error_message = $e->getMessage();
        display_db_error($error_message);
    }
}

function get_product($product_id) {
    global $db;
    $query = '
        SELECT *
        FROM products p
           INNER JOIN categories c
           ON p.categoryID = c.categoryID
       WHERE productID = :product_id';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue(':product_id', $product_id);
        $statement->execute();
        $result = $statement->fetch();
        $statement->closeCursor();
        return $result;
    } catch (PDOException $e) {
        $error_message = $e->getMessage();
        display_db_error($error_message);
    }
}

function get_product_order_count($product_id) {
    global $db;
    $query = '
        SELECT COUNT(*) AS orderCount
        FROM orderitems
        WHERE productID = :product_id';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue(':product_id', $product_id);
        $statement->execute();
        $product = $statement->fetch();
        $order_count = $product['orderCount'];
        $statement->closeCursor();
        return $order_count;
    } catch (PDOException $e) {
        $error_message = $e->getMessage();
        display_db_error($error_message);
    }
}

function add_product($category_id, $code, $name, $description,
        $price, $discount_percent) {
    global $db;
    $query = 'INSERT INTO products
                 (categoryID, productCode, productName, description, listPrice,
                  discountPercent, dateAdded)
              VALUES
                 (:category_id, :code, :name, :description, :price,
                  :discount_percent, NOW())';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue(':category_id', $category_id);
        $statement->bindValue(':code', $code);
        $statement->bindValue(':name', $name);
        $statement->bindValue(':description', $description);
        $statement->bindValue(':price', $price);
        $statement->bindValue(':discount_percent', $discount_percent);
        $statement->execute();
        $statement->closeCursor();

        // Get the last product ID that was automatically generated
        $product_id = $db->lastInsertId();
        return $product_id;
    } catch (PDOException $e) {
        $error_message = $e->getMessage();
        display_db_error($error_message);
    }
}

function update_product($product_id, $code, $name, $desc,
                        $price, $discount, $category_id) {
    global $db;
    $query = '
        UPDATE Products
        SET productName = :name,
            productCode = :code,
            description = :desc,
            listPrice = :price,
            discountPercent = :discount,
            categoryID = :category_id
        WHERE productID = :product_id';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue(':name', $name);
        $statement->bindValue(':code', $code);
        $statement->bindValue(':desc', $desc);
        $statement->bindValue(':price', $price);
        $statement->bindValue(':discount', $discount);
        $statement->bindValue(':category_id', $category_id);
        $statement->bindValue(':product_id', $product_id);
        $statement->execute();
        $statement->closeCursor();
    } catch (PDOException $e) {
        $error_message = $e->getMessage();
        display_db_error($error_message);
    }
}

function delete_product($product_id) {
    global $db;
    $query = 'DELETE FROM products WHERE productID = :product_id';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue(':product_id', $product_id);
        $statement->execute();
        $statement->closeCursor();
    } catch (PDOException $e) {
        $error_message = $e->getMessage();
        display_db_error($error_message);
    }
}

//function to decrement quantity after processing order
function decrement_product($product_id, $quantity) {
    global $db;
    $query = '
        UPDATE products 
        SET quantity = quantity - :quantity 
        WHERE productID = :product_id';
    try {
        $statement = $db->prepare($query);
        $statement->bindValue(':product_id', $product_id);
        $statement->bindValue(':quantity', $quantity);
        $statement->execute();
        $statement->closeCursor();
    } catch (PDOException $e) {
        $error_message = $e->getMessage();
        display_db_error($error_message);
    }
}
?>