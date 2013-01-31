
function Trig_Set_up_Item_Array_Actions takes nothing returns nothing
  set udg_DItems[0]='kybl'
  set udg_DItems[1]='ches'
  set udg_DItems[2]='bzbe'
  set udg_DItems[3]='engs'
  set udg_DItems[4]='bzbf'
  set udg_DItems[5]='gmfr'
  set udg_DItems[6]='ledg'
  set udg_DItems[7]='kygh'
  set udg_DItems[8]='gopr'
  set udg_DItems[9]='azhr'
  set udg_DItems[10]='cnhn'
  set udg_DItems[11]='dkfw'
endfunction

function InitTrig_Set_up_Item_Array takes nothing returns nothing
    set gg_trg_Set_up_Item_Array = CreateTrigger(  )
    call TriggerAddAction( gg_trg_Set_up_Item_Array, function Trig_Set_up_Item_Array_Actions )
endfunction