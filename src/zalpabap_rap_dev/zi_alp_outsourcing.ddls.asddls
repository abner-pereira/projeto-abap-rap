@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Locação BO View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define root view entity ZI_ALP_OUTSOURCING
  as select from zalp_outsourcing
  composition [1..*] of ZI_ALP_ACTIVITY as _activity
  association [1..1] to ZI_ALP_EMPLOYEE as _employee on _employee.EmployeeUuid = $projection.EmployeeUuid
  association [1..1] to ZI_ALP_CUSTOMER as _customer on _customer.CustomerUuid = $projection.CustomerUuid
{
  key outsource_uuid as OutsourceUuid,
      date_beg       as DateBeg,
      date_end       as DateEnd,
      employee_uuid  as EmployeeUuid,
      customer_uuid  as CustomerUuid,

      //Entidades
      _activity,
      _employee,
      _customer
}
