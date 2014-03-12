row = "
  <tr>
      <td ng-mouseenter='mode = 0'>
        <span ng-show='mode == 1 '>{{data.GasOperatingPoints.T}} </span>
        <input class='form-control' id='txtToolTip' ng-show='mode != 1' ng-model='data.GasOperatingPoints.T' autofocus='true' ng-enter/></td>
       <td ng-mouseenter='mode = 0'>
											<span ng-show='mode == 1'>{{data.GasOperatingPoints.Vp}}</span>
											<select class='form-control' ng-show='mode == 1' ng-model='data.GasOperatingPoints.VpUnits' disabled ng-enter>
												<option>{{VpUnits}}</option></select>
											<input class='form-control' type='text' ng-show='mode != 1' ng-model='data.GasOperatingPoints.Vp' ng-enter/>
											<select class='form-control' ng-show='mode != 1' ng-model='data.GasOperatingPoints.VpUnits' ng-enter>
												<option ng-selected='true'> M3/S </option>
												<option>M3/M</option>
												<option> M3/H</option>
												<option> NM3/S</option>
												<option> NM3/M</option>
												<option> NM3/H</option>
												</select>
												</td>
       </tr> "

(angular.module 'reitz')
.directive 'ngEnter',($compile)->
    ($scope,elem,attrs)->
      elem.bind 'keypress', (e) ->
        console.log elem
        if (e.keyCode is 13 and elem.siblings())
          #elem.parent().siblings().next().focus()
          if elem.parent().next().children().length is 4
             elem.parent().next().children()[2].focus()
          else
            elem.parent().next().find('input').focus()
          ### contentTr = angular.element('<tr><td><input/></td></tr>')
          contentTr.insertBefore(elem.parents().find('tbody').find('tr')[0])
          $compile(contentTr)($scope)###
          #console.log  elem.parent().next().children()
        else if (e.keyCode is 13 and elem.parents())
          elem.parents('td').next().find('input[type=text]').focus()
          console.log elem.parents('td').next().find('input[type=text]')
.directive 'ngAddrow',($compile)->
    ($scope,elem,attrs)->
      elem.bind 'keypress', (e) ->
        if (e.keyCode is 13)
          contentTr = angular.element(row)
          contentTr.insertBefore(elem.parents().find('tbody').find('tr')[0])
          $compile(contentTr)($scope)

