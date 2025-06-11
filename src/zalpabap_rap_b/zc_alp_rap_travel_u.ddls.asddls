@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel data'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_ALP_RAP_Travel_U
  as projection on ZI_ALP_RAP_TRAVEL_U
{
  key TravelID,
      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Agency', element: 'AgencyID' } } ]
      @Search.defaultSearchElement: true
      AgencyID,
      @Consumption.valueHelpDefinition: [ { entity: { name: '/DMO/I_Customer', element: 'CustomerID' } } ]
      @Search.defaultSearchElement: true
      CustomerID,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [ { entity: { name: 'I_Currency', element: 'Currency' } } ]
      CurrencyCode,
      Description,
      Status,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,

      /* Associations */
      _Agency,
      _Booking : redirected to composition child ZC_ALP_RAP_BOOKING_U,
      _Currency,
      _Customer
}
