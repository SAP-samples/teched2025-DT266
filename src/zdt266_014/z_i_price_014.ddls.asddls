@AbapCatalog.sqlViewName: 'ZPRICE_014'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View to calculate the PRICE_SUM'
@Metadata.ignorePropagatedAnnotations: true
define view  Z_I_PRICE_014 
as select from /dmo/connection as conn
inner join /dmo/booking as book on conn.connection_id = book.connection_id
inner join Z_I_BOOK_SUPPL as book_suppl on book_suppl.booking_id = book.booking_id and book_suppl.travel_id = book.travel_id
association [1..1] to Z_I_SUPPL as suppl on suppl.supplement_id = book_suppl.supplement_id 
and suppl.id = book_suppl.id
{
key conn.carrier_id as CarrierId,
suppl.id + 1 as id,
//suppl.id as id,
sum(suppl.price) as suppl_price_sum,
sum(suppl.price_lugg) as suppl_price_sum_lugg,
sum(suppl.price_meal) as suppl_price_sum_meal,
sum(suppl.price_bev) as suppl_price_sum_bev
} group by conn.carrier_id, suppl.id
