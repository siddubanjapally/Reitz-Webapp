indexView =(req,res) ->
  res.render 'index'
partialViews = (req,res)->
  viewName = req.params.name
  res.render 'customer/' + viewName

module.exports = {
  index: indexView,
  customer: partialViews
}