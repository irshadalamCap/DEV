body{
    font-Size: 14px !important;
}

.helpPopupClass{
    font-Size : 13px;
}

.clstest
{
    overflow:auto !important;
    height:500px !important;
}

div.demo {
    position: relative;
    min-height: 100px;
    overflow:auto;
}
.btn-group>.btn:first-child:not(:last-child):not(.dropdown-toggle) {
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
}
.btn-group>.btn:last-child:not(:first-child), .btn-group>.dropdown-toggle:not(:first-child) {
    border-top-left-radius: 4px;
    border-bottom-left-radius: 4px;
}

.btn {
    border:1px solid #efefef;
    padding: 2px 6px;
}
@media all and (max-width: 1000px)
{
    .ui-block-a,
    .ui-block-b,
    .ui-block-c,
    .ui-block-d,
    .ui-block-e {
        width: 100% !important;
        float:none !important;
    }
}

.buttonlabel{
    margin-bottom: 5px;
    width: 84px;
    border-left-width: 0px;
    margin-left: 0px;
    padding-top: 3px;
    padding-bottom: 3px;
    padding-right: 3px;
    padding-left: 3px;
    border-top-width: 0px;
    border-right-width: 0px;
    border-bottom-width: 0px;
    border-radius: 10px;
    height: 29px;
    background: #BDBDBD;
    cursor:pointer;
    cursor:hand;
    color:white;
}

.PopupPanel{
    border: solid 1px black;
    left: 50%;
    top: 50%;
    background-color: white;
    z-index: 100;
    position: absolute;
    height: 350px;
    width: 270px;
}
.hierarchymsg{
    display:none;
<!--margin-left: 10px;
margin-top:30px;
margin:40px 10px 10px -17%;
padding: 3px;
background-color: rgb(239, 234, 226);
color:black;
font-weight:normal;-->
}

.myFormStyle {
    background-color: grey;
}

.topbar-dialog {
    font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif !important;
    color: #3d3d3d;
    font-size: 12px;
    background-color: #fff;
    box-shadow: 0 2px 2px rgba(0,0,0,0.2);
    z-index: 999;
    position: absolute;
    text-align: left;
    border-left: 1px solid #e0e0e0;
    border-right: 1px solid #e0e0e0;
    border-bottom: 1px solid #e0e0e0;
}

.siteSwitcher-dialog {
    overflow-y: scroll;
}
h1, .h1 {
    font-size: 14px;
}

hr, .hr{
    margin-top: 10px;
    margin-bottom: 0px;
    border: 0;
    border-top: 1px solid #eee;
}

/* for iPhone 4+ */
/*@media screen and (max-device-width: 480px) and (-webkit-min-device-pixel-ratio: 2){*/
/*.iphone4s{*/

/*}*/
/*}*/

.accnameWidth{
    position: relative;
    overflow-x: scroll;
    padding-top: 5px;
    width: 480px;
    padding-left: 60px;
}

.imgResize img{
    width:15px;
}
.imgResizeStar img{
    width:60px;
}
.imgOther img{
    width:20px;
}
td.rich-tabhdr-side-border img {
    width: 1px;
}
a:link:after, a:visited:after {
    content: normal !important;
}

.header {
    display:table;
    width:100%;
}
.header  .choose-account, .header  .title, .header  .buttons  {
    display: table-cell;
}
.header .choose-account .btn-group {
    position:relative;
}
.header .title a {
    display:block;
    padding:0 10px;
}
.header .buttons {
    white-space: nowrap;
}


table th { white-space: normal; }

.analyticsEmbeddedReportChart.width_small {
    width: auto;
    margin: 0px auto;
}
.width_small .analyticsEmbeddedReportChart {
    background: #DDDDDD;
    text-align: center;
}
.outerbound {
    border: none!important;
}
.asOfDateContainer {
    text-align:center;
}
.chartContainer {
    min-height:200px;
}
.analyticsEmbeddedChart .analyticsCordaChart {
    float: none;
    text-align: center;
    display: block;
    min-height: 270px;
}
.analyticsEmbeddedReportChart img {
    margin: 0 auto;
}
.analyticsEmbeddedChart .spacer {
    display:none;
}
.panel-heading {
    position: relative;
}
.panel-heading select {
    display: block;
    width: 100%;
    margin-top: 10px;

}
.panel-heading select + div {
    position: absolute;
    right: 18px;
    top: 10px;
    display: block;
}
.topbar-dialog {
    height:386px;
    top: 35px;
    width:580px;
}

#accPlanDiv a {
    word-break: break-all;
}

#optylose {
    padding: 0 10px;
    margin-right: -10px;
}

.vf-reset {
    text-align: center;
}

@media only screen and (min-width: 768px) and (max-width: 959px){
    .vf-surface {
        zoom: 0.8;
        -moz-transform: scale(0.8);
        -moz-transform-origin: left;
    }
}

@media only screen and (min-width: 1200px){
    .vf-surface {
        zoom: 0.85;
        -moz-transform: scale(0.85);
        -moz-transform-origin: left;
    }
}

@media only screen and (max-width: 400px) {
    .analyticsEmbeddedReportChart {
        zoom: 0.65;
        -moz-transform: scale(0.65);
        -moz-transform-origin: left;
    }
    
    .vf-surface {
        zoom: 0.55;
        -moz-transform: scale(0.55);
        -moz-transform-origin: left;
    }
}

@media only screen and (min-width: 401px) and (max-width: 480px) {
    .analyticsEmbeddedReportChart {
        zoom: 0.8;
        -moz-transform: scale(0.8);
        -moz-transform-origin: left;
    }
    .vf-surface {
        zoom: 0.7;
        -moz-transform: scale(0.75);
        -moz-transform-origin: left;
    }
}

@media only screen and (max-width: 769px) {
    .header, .header .btn-group,
    .header input, .header a, .header label, .header .btn-group>.btn {
        display:block;
        width:100%;
        float:none;
    }
    .header .choose-account .btn-group {
        position:relative;
    }
    .header .choose-account, .header .title, .header .buttons  {
        display: block;
    }
    .header .buttons .btn-group.hierarchy > span {
        position: absolute;
        right: 10px;
        z-index: 10;
        margin-top: -30px;
    }
    .header .title {
        text-align: center;
        padding:10px;
    }
    .header .buttons {
        white-space: normal;
    }

    ul.nav-tabs li {
        margin:0;
        float:none;
    }
    ul.nav-tabs li a {
        margin: 0;
    }

    .topbar-dialog {
        width:100%;
    }

    /* Force table to not be like tables anymore */
    .table-responsive > table table,
    .table-responsive > table thead,
    .table-responsive > table tbody,
    .table-responsive > table th,
    .table-responsive > table td,
    .table-responsive > table tr {
        display: block;
        font-size: 12px;
    }

    /* Hide table headers (but not display: none;, for accessibility) */
    .table-responsive.with-thead > table thead tr {
        position: absolute;
        top: -9999px;
        left: -9999px;
    }

    .table-responsive.with-thead > table tr { border: 1px solid #ccc; }

    .table-responsive.with-thead > table td {
        /* Behave  like a "row" */
        border: none;
        border-bottom: 1px solid #eee;
        position: relative;
        white-space: normal;
        text-align:left;
    }

    .table-responsive.with-thead > table td:before {
        text-align:left;
        font-weight: bold;
        display:inline-block;
        width:50%;
        white-space: normal;
    }

    .table-responsive.with-thead.one-column td:before {
        width:100%;
        padding:10px;
        background: #F4F4F4;
    }

    .table-responsive.with-thead > table > tbody > tr > td:before { content: attr(data-title); }

    .table-responsive.no-thead > table label {
        height: auto;
        font-size:14px;
    }
    .table-responsive.no-thead > table td {
        text-align: left;
    }
    .table-responsive.no-thead > table td:nth-child(odd) {
        background: #f4f4f4;
    }
}

@media print {
    .panel, .panel-primary, .table-responsive {
        page-break-inside: avoid;

    }
    .panel-body {
        padding: 5px;
    }
    .charts {
        page-break-after: always;
    }
    .header .choose-account, .header .buttons {
        display: none;
    }
    .header .title a {
        font-size: 18px;
    }
    .summary-table {
        font-size:13px;
    }
    .charts .col-print-4 {
        width: 33.333%!important;
        page-break-inside: avoid;
    }
    .charts .col-print-4:nth-child(3n+4) {
        clear:both;
    }
    .analyticsEmbeddedReportChart.width_small {
        width: auto!important;
    }
    .analyticsEmbeddedReportChart img {
        width: 100%;
    }
    .analyticsEmbeddedChart .analyticsCordaChart, .chartContainer {
        min-height: 0!important;
    }
    .refreshButton {
        display: none!important;
    }
    .htmlDetailElementTable {
        font-size: 10px;
    }
    body .bDetailBlock.bPageBlock, body .individualPalette .bDetailBlock.bPageBlock, .table {
        margin-bottom: 0!important;
    }
}