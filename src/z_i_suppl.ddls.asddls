@AbapCatalog.sqlViewName: 'ZSUPPL'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View to calculate the PRICE_SUM'
@Metadata.ignorePropagatedAnnotations: true
define view  Z_I_SUPPL 
as select from zdt266_sup_l_000 as suppl
{
key supplement_id,
suppl.id as id,
case when suppl.supplement_category = 'LU' then suppl.price end as price_lugg,
case when suppl.supplement_category = 'ML' then suppl.price end as price_meal,
case when suppl.supplement_category = 'BV' then suppl.price end as price_bev,
suppl.price as price
} 

