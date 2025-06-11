@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking data'
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZC_ALP_RAP_BOOKING_U
  as projection on ZI_ALP_RAP_BOOKING_U
{
      @Search.defaultSearchElement: true
  key TravelID,
      @Search.defaultSearchElement: true
  key BookingID,
      BookingDate,
      @Consumption.valueHelpDefinition: [ { entity: { name:     '/DMO/I_Customer',
                                                   element:     'CustomerID' } } ]
      CustomerID,
      @Consumption.valueHelpDefinition: [ { entity: { name:     '/DMO/I_Carrier',
                                                   element:     'AirlineID' } } ]
      CarrierID,
      @Consumption.valueHelpDefinition: [ { entity: { name:    '/DMO/I_Flight',
                                                      element: 'ConnectionID' },
                                            additionalBinding: [ { localElement: 'FlightDate',
                                                                   element:      'FlightDate',
                                                                   usage: #RESULT },
                                                                 { localElement: 'CarrierID',
                                                                        element: 'AirlineID',
                                                                          usage: #RESULT },
                                                                 { localElement: 'FlightPrice',
                                                                        element: 'Price',
                                                                          usage: #RESULT },
                                                                 { localElement: 'CurrencyCode',
                                                                        element: 'CurrencyCode',
                                                                          usage: #RESULT } ]
                                            } ]
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,

      @Consumption.valueHelpDefinition: [ {entity: { name:    'I_Currency',
                                                     element: 'Currency' } } ]
      CurrencyCode,

      /* Associations */
      _Carrier,
      _Customer,
      _Travel : redirected to parent ZC_ALP_RAP_Travel_U
}
