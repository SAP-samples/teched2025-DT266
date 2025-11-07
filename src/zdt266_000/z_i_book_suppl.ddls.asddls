@AbapCatalog.sqlViewName: 'ZBOOK_SUPPL'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View to calculate the PRICE_SUM'
@Metadata.ignorePropagatedAnnotations: true
define view  Z_I_BOOK_SUPPL 
as select from zdt266_bo_su_000 as bo_su
{
key bo_su.travel_id,
bo_su.booking_id as booking_id,
bo_su.id as id,
bo_su.booking_supplement_id as booking_supplement_id,
bo_su.supplement_id as supplement_id
} 

