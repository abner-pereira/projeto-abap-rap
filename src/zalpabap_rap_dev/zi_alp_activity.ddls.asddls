@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Atividade BO View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_ALP_ACTIVITY
  as select from zalp_activity
  association to parent ZI_ALP_OUTSOURCING as _outsourcing on _outsourcing.OutsourceUuid = $projection.OutsourceUuid
{
  key activity_uuid         as ActivityUuid,
      date_activ            as DateActiv,
      time_activ            as TimeActiv,
      descricao             as Descricao,
      last_changed_by       as LastChangedBy,
      last_changed_at       as LastChangedAt,
      local_last_changed_at as LocalLastChangedAt,
      outsource_uuid        as OutsourceUuid,

      //Entidades
      _outsourcing
}
