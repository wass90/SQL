SELECT 
    nfs.num_nf,
    nfs.dt_emis,
    inf.cod_item,
    inf.descricao,
    inf.qtde,
    inf.vlr_total
FROM tnfs_saida      nfs
JOIN titens_nfs      inf  ON inf.nfs_id   = nfs.id
JOIN titens_comercial tcm  ON tcm.id      = inf.itcm_id
JOIN titens_contabil tc    ON tc.itempr_id = tcm.itempr_id
JOIN tgrp_invent     gi    ON gi.id       = tc.grp_invent_id
WHERE nfs.dt_emis >= DATE '2025-01-01'
  AND nfs.dt_emis <  DATE '2026-01-01'
  AND gi.cod_grp_invent = 400;
