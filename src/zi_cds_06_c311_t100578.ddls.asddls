@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aggregation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zi_cds_06_c311_T100578
  as select from /dmo/travel
{
  //   key travel_id as TravelID,
  //     agency_id as AgencyID,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  min( cast(total_price as abap.dec( 16, 2 ))) as MinTotalPrice,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  max( cast(total_price as abap.dec( 16, 2 ))) as MaxTotalPrice,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  sum( cast(total_price as abap.dec( 16, 2 ))) as SumTotalPrice,

  count( distinct total_price )                as CountDistinctTotalPrice,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  avg( total_price as abap.curr( 16, 2 )  )    as AvgTotalPrice,

  currency_code                                as CurrencyCode
}
group by
//travel_id, agency_id,
  currency_code
