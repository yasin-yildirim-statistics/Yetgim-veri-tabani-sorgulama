select * from categories;
select * from products;

-- AVG, SUM , MIN , MAX , COUNT

SELECT AVG(price) as "Ürünlerin Fiyat ortlaması" FROM PRODUCTS;

SELECT SUM(price) as "Ürünlerin Fiyat toplamı" from products;
SELECT MIN(stock) as "En Düşük Stok miktarı" from products;

SELECT MAX(stock) as "En Yüksek Stok miktarı" from products;

SELECT count(*) as "Ürün Sayısı" from products;

SELECT
AVG(price) as "Ürünlerin Fiyat ortlaması",
SUM(price) as "Ürünlerin Fiyat toplamı",
MIN(stock) as "En Düşük Stok miktarı",
MAX(stock) as "En Yüksek Stok miktarı",
count(*) as "Ürün Sayısı" from products;


-- Kategori id alanı : 3              Ürün Adetleri : 10
-- SELECT kolon1, kolon2,... , AGGREGATE_FUNCTION FROM tablo_adi group by kolon1, kolon2,...;


-- Kategori id lerine göre kaç tane ürün var ise gruplayınız.

SELECT category_id,  count(*) as "Ürün Sayısı", avg(price) as "Ürünlerin Ortalama Fiyatı" from products group by category_id;





SELECT   c.name as "Kategori Adı", products.name as "Ürün Adı"
FROM products
LEFT JOIN categories c  on products.category_id = c.id;



SELECT   c.name as "Kategori Adı", products.name as "Ürün Adı"
FROM products
RIGHT JOIN categories c  on products.category_id = c.id;


SELECT   c.name as "Kategori Adı", products.name as "Ürün Adı"
FROM products
INNER JOIN categories c  on products.category_id = c.id;



SELECT   c.name as "Kategori Adı",  count(products.id) as "Ürün Sayısı", avg(products.price) as "Ürünlerin Ortalama Fiyatı"
FROM products
INNER JOIN categories c  on products.category_id = c.id
GROUP BY "Kategori Adı";


SELECT products.category_id as "Kategori Id",  c.name as "Kategori Adı",  count(products.id) as "Ürün Sayısı", avg(products.price) as "Ürünlerin Ortalama Fiyatı"
FROM products
INNER JOIN categories c  on products.category_id = c.id
GROUP BY "Kategori Id","Kategori Adı";








