select * from products;
select * from categories;

select * from products where  category_id= 6;


-- Ürünleri kategorilerine grupladıktan sonra stok miktarlarının birim fiyatları ile çarpıp kdv oranını da ekleyip oluşan fiyatlara gruplayınız.

SELECT
    c.name as "Kategori Adı", sum(products.price * products.stock * 1.2) as "Ürünlerin Toplam gelir beklentisi"
FROM products inner join categories c on c.id = products.category_id
GROUP BY "Kategori Adı" ORDER BY "Ürünlerin Toplam gelir beklentisi" DESC;





