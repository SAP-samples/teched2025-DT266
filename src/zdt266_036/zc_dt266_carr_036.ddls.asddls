@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@EndUserText: {
  label: '###GENERATED Core Data Service Entity'
}
@ObjectModel: {
  sapObjectNodeType.name: 'ZDT266_CARR_036'
}
@AccessControl.authorizationCheck: #MANDATORY
define root view entity ZC_DT266_CARR_036
  provider contract transactional_query
  as projection on ZR_DT266_CARR_036
  association [1..1] to ZR_DT266_CARR_036 as _BaseEntity on $projection.CarrierID = _BaseEntity.CarrierID
{
  @Consumption: {
    valueHelpDefinition: [ {
      entity.element: 'AirlineID', 
      entity.name: '/DMO/I_Carrier_StdVH', 
      useForValidation: true
    } ]
  }
  key CarrierID,
  Name,
  @Consumption: {
    valueHelpDefinition: [ {
      entity.element: 'Currency', 
      entity.name: 'I_CurrencyStdVH', 
      useForValidation: true
    } ]
  }
  CurrencyCode,
  
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_DT266_CARR_EXTENSION_036'
  @EndUserText.label: 'AggregateSupplementsPrice'
  virtual AggregateSupplementPrice : abap.int8,
  
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_DT266_CARR_EXTENSION_036'
  @EndUserText.label: '%Meals'
  virtual PercMeal : abap.int8,
  
  @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_DT266_CARR_EXTENSION_036'
  @EndUserText.label: '%Beverages'
  virtual PercBeverages : abap.int8,
  
    @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_DT266_CARR_EXTENSION_036'
  @EndUserText.label: '%Luggage'
  virtual PercLuggage : abap.int8,
  
 @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_DT266_CARR_EXTENSION_036'
  @EndUserText.label: 'AggregatedFlightPrice'
  virtual AggregateFlightPrice : abap.int8,
  
  
  @Semantics: {
    user.createdBy: true
  }
  LocalCreatedBy,
  @Semantics: {
    systemDateTime.createdAt: true
  }
  LocalCreatedAt,
  @Semantics: {
    user.localInstanceLastChangedBy: true
  }
  LocalLastChangedBy,
  @Semantics: {
    systemDateTime.localInstanceLastChangedAt: true
  }
  LocalLastChangedAt,
  @Semantics: {
    systemDateTime.lastChangedAt: true
  }
  LastChangedAt,
  _BaseEntity
}
