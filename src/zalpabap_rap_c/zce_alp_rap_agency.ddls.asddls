@EndUserText.label: 'Custom entity for agencies from ES5'
@ObjectModel.query.implementedBy: 'ABAP:ZCL_ALP_CE_RAP_AGENCY'
define custom entity ZCE_ALP_RAP_AGENCY
{
      @EndUserText.label: 'Agency Id'
  key Agency_Id        : abap.numc( 6 );    
      @OData.property.valueControl: 'Name_vc'
      Name            : abap.char( 31 );
      Name_vc         : rap_cp_odata_value_control;
      @OData.property.valueControl: 'Street_vc'
      Street          : abap.char( 30 );
      Street_vc       : rap_cp_odata_value_control;
      @OData.property.valueControl: 'Postal_Code_vc'
      @EndUserText.label: 'Postal Code'
      Postal_Code     : abap.char( 10 );
      Postal_Code_vc  : rap_cp_odata_value_control;
      @OData.property.valueControl: 'City_vc'
      City            : abap.char( 25 );
      City_vc         : rap_cp_odata_value_control;
      @OData.property.valueControl: 'Country_vc'
      Country         : abap.char( 3 );
      Country_vc      : rap_cp_odata_value_control;
      @OData.property.valueControl: 'Phone_Number_vc'
      @EndUserText.label: 'Phone Number'
      Phone_Number    : abap.char( 30 );
      Phone_Number_vc : rap_cp_odata_value_control;
      @OData.property.valueControl: 'Web_Address_vc'
      @EndUserText.label: 'Web Address'
      Web_Address     : abap.char( 255 );
      Web_Address_vc  : rap_cp_odata_value_control;
}
