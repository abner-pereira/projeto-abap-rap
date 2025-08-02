@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Empregado BO View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_ALP_EMPLOYEE
  as select from zalp_employee
{
  key employee_uuid         as EmployeeUuid,
      employee_id           as EmployeeId,
      first_name            as FirstName,
      last_name             as LastName,
      hired_date            as HiredDate,
      fired_date            as FiredDate,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      last_changed_by       as LastChangedBy,
      last_changed_at       as LastChangedAt,
      local_last_changed_at as LocalLastChangedAt
}
