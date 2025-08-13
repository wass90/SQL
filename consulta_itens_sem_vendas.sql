SELECT
    t.cod_item,
    t.desc_tecnica
FROM titens t
JOIN titens_empr te       ON te.item_id      = t.id       AND te.sit = 1
JOIN titens_contabil tc   ON tc.itempr_id    = te.id
JOIN tgrp_invent g        ON g.id            = tc.grp_invent_id
WHERE g.cod_grp_invent = 400
  AND t.sit = 1
  AND NOT EXISTS (
      SELECT 1
      FROM tnfs_saida n
      JOIN titens_nfs ni ON ni.nfs_id = n.id
      WHERE ni.cod_item = t.cod_item
        AND n.dt_emis >= DATE '2024-01-01'
        AND n.sit_nf <> 'C'
  );
