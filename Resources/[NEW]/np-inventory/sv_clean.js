setInterval(() => {
    db(`DELETE FROM user_inventory2 WHERE name like '%Drop-%'`);
}, 10 * 60 * 1000);