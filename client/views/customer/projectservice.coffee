(angular.module 'reitz')
.factory 'projectservice',()->
    data = {}
    generateId = ->
      id = 0
      ()->
        id++
    G = ->
      (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)
    guid = ->
      (G() + G() + "-" + G() + "-" + G() + "-" + G() + "-" + G() + G() + G()).toUpperCase()
    entitykey = (keyname)->
      $id :generateId()
      EntitySetName:kyename
      EntityContainerName:"FanalytixEntities"
      EntityKeyValues:[
        {
          Key:"Id",
          Type:"System.Guid",
          Value:guid()
        }
      ]

