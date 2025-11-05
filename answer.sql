SELECT 
    it.investor_id,
    s.sector_name,
    SUM(it.no_of_shares) AS sector_shares,
    ROUND(
        SUM(it.no_of_shares) * 100.0 /
        (SELECT SUM(no_of_shares)
         FROM investor_transactions t
         WHERE t.investor_id = it.investor_id),
        2
    ) AS share_percentage
FROM investor_transactions it
JOIN sectors s ON it.sector_id = s.sector_id
GROUP BY it.investor_id, s.sector_name;
