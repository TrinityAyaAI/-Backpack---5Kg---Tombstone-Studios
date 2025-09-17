-- install_mochila.sql (Insere se não existir na base de dados)
INSERT INTO `items` (`item`, `label`, `limit`, `can_use`, `type`, `usable`, `description`, `weight`)
SELECT 'tt_mochila_extra', 'Mochila Extra', 1, 1, 'item_standard', 1, 'Aumenta a capacidade da mochila em +5 slots.', 0
FROM DUAL
WHERE NOT EXISTS (
  SELECT 1 FROM `items` WHERE `item` = 'tt_mochila_extra'
);
