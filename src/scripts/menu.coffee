do ->
  'use strict'
  angular
    .module('dmk.menu', [])
    .directive('dmkMenu', [ ->
      restrict: 'A'
      templateUrl: '/bower_components/dmk-menu/templates/dmk-menu.html'

      scope:
        dmkIcon: "="
        dmkOptions: "="
        dmkNameOption: "="
        dmkSearchFirst:"="
        dmkSearchSecond:"="
        dmkUrl: "="
        dmkType: "@"

      link: (scope, element, attr) ->
        if scope.dmkSearchFirst == ""
          scope.dmkSearchFirst = false
        if scope.dmkSearchSecond == ""
          scope.dmkSearchSecond = false

        scope.getNameOption = (name, url, index)->
          scope.dmkNameOption = name
          scope.dmkUrl = url

          for i in [0...scope.dmkOptions.length]
            if scope.dmkOptions[i].name != name
              scope.dmkOptions[i].isActive = false

          if scope.dmkOptions[index].isActive == true
            scope.dmkOptions[index].isActive = false
          else
            scope.dmkOptions[index].isActive = true

        scope.getNameDropdown = (name, url, parentIndex, index) ->
          scope.dmkNameOption = name
          scope.dmkUrl = url
          for i in [0...scope.dmkOptions[parentIndex].dropdowns.length]
            if scope.dmkOptions[parentIndex].dropdowns[i].name != name
              scope.dmkOptions[parentIndex].dropdowns[i].isActive = false

          if scope.dmkOptions[parentIndex].dropdowns[index].isActive == true
            scope.dmkOptions[parentIndex].dropdowns[index].isActive = false
          else
            scope.dmkOptions[parentIndex].dropdowns[index].isActive = true

        scope.getNameSuboption = (name, url) ->
          scope.dmkNameOption = name
          scope.dmkUrl = url

        return
  ])
  return