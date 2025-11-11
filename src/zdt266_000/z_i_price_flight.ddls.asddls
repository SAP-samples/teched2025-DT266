@AbapCatalog.sqlViewName: 'ZPRICEFLIGHT'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View to calculate the PRICE_SUM'
@Metadata.ignorePropagatedAnnotations: true
define view  Z_I_PRICE_FLIGHT 
as select from /dmo/connection as conn
inner join /dmo/booking as book on conn.connection_id = book.connection_id
{
key conn.carrier_id as CarrierId,
sum(book.flight_price) as flight_price_sum
} group by conn.carrier_id

