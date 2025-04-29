@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item Type Value Help'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZI_ITEMTYP
  as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name : 'ZITEM_TYP' )
{
      @Search: { defaultSearchElement : true,
                 fuzzinessThreshold   : 0.8  }
      @ObjectModel.text.element: ['ItemTypeText']
      @EndUserText.label: 'Item Type'
  key cast(left( value_low, 4 ) as zitem_typ ) as ItemType,
      text                                     as ItemTypeText
}
where
      language       = $session.system_language
  and value_position is not initial 
