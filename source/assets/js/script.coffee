#= require imagesloaded.pkgd.min
#= require_self

angular.module 'app', []

.directive 'lazyload', ['$window', ($window) ->
  restrict: 'A'
  link: (scope, element) ->
    imgUrl = window.getComputedStyle(element[0]).getPropertyValue 'background-image'
    if imgUrl
      imgUrl = imgUrl.match(/(http(s)*.+(jpg))/g)[0]
      imgTag = new Image(); imgTag.src = imgUrl
      imagesLoaded imgTag, -> element[0].classList.remove 'unloaded'
    return
]
