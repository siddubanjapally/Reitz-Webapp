(angular.module 'reitz')
.factory 'dropdownvalues',()->
    PressureDiff : [{name:'Lines 0,3(Fan with Pressure Losses at both sides)',value:0},{name:'Lines 0,2(Fan with Pressure Losses at inlet)',value:1},{name:'Lines 1,3(Fan with Pressure Losses at outlet)',value:2},{name:'Lines 1,2(Only the Fan)',value:3}]
    InletSoundSilencer :['0','0.1','0.2','0.25','0.3','0.4','0.5']
    InletBox:['0','0.1','0.15','0.2','0.3','1']
    InletOtherParts:['0','0.15','0.20']
    OutletSilencer:['0','0.3','0.4','0.5']
    OutletOtherParts:['0','1']
    InletOutletDuct:[{name:'Free inlet,ducted outlet',value:0},{name:'Free outlet,ducted inlet',value:1},{name:'Ducted inlet and outlet',value:2}]
    Width:[{name:'Single Width',value:0},{name:'Double Width',value:1}]
    Control:[{name:'None',value:0},{name:'Speed Control',value:1},{name:'Inlet Vane Control',value:2},{name:'Dumper Control',value:3}]
    InletSoundSilencer:['0','0.1','0.2','0.25','0.3','0.4','0.5']