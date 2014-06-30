
setHeight = ->
  $("#reportViewer1").height window.innerHeight
  prevPageHeight = window.innerHeight
  return
prevPageHeight = 0 
setInterval (->
  setHeight()  unless window.innerHeight is prevPageHeight
  return
), 500
setHeight()
$reportViewer = $("#reportViewer1").telerik_ReportViewer(
  serviceUrl: "http://192.168.0.160/ReportService/api/reports/"
  templateUrl: "ReportViewer/templates/telerikReportViewerTemplate.html"
  reportSource:
    report: "Sankar.trdx"
  parameters:
    addressid: 2
)