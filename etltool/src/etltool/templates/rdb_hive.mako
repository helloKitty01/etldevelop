<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Hue 
    - Metastore Manager
 
    - 手动创建表
</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <link href="/static/ext/css/bootplus.css" rel="stylesheet">
  <link href="/static/ext/css/font-awesome.min.css" rel="stylesheet">
  <link href="/static/css/hue3.css" rel="stylesheet">
  <link href="/static/ext/css/fileuploader.css" rel="stylesheet">

  <style type="text/css">
      body {
        display: none;
        padding-top: 90px;
      }
  </style>
  <style type="text/css">
  h1 {
    margin-bottom: 5px;
  }

  #filechooser {
    min-height: 100px;
    overflow-y: auto;
  }

  .control-group {
    margin-bottom: 3px!important;
  }

  .control-group label {
    float: left;
    padding-top: 5px;
    text-align: left;
    width: 40px;
  }

  .hueBreadcrumb {
    padding: 12px 14px;
  }

  .hueBreadcrumbBar {
    padding: 0;
    margin: 12px;
  }

  .hueBreadcrumbBar a {
    color: #338BB8 !important;
    display: inline !important;
  }

  .divider {
    color: #CCC;
  }

  .param {
    padding: 8px 8px 1px 8px;
    margin-bottom: 5px;
    border-bottom: 1px solid #EEE;
  }

  .remove {
    float: right;
  }

  .selectable {
    display: block;
    list-style: none;
    padding: 5px;
    background: white;
    cursor: pointer;
  }

  .selected, .selectable:hover {
    background: #DDDDDD;
  }

  .CodeMirror {
    border: 1px solid #eee;
    margin-bottom: 20px;
  }

  .editorError {
    color: #B94A48;
    background-color: #F2DEDE;
    padding: 4px;
    font-size: 11px;
  }

  .editable-empty, .editable-empty:hover {
    color: #666;
    font-style: normal;
  }

  .tooltip.left {
    margin-left: -13px;
  }

  .scrollable {
    overflow-x: auto;
  }

  .resultTable td, .resultTable th {
    white-space: nowrap;
  }

  .empty-wrapper {
    margin-top: 50px;
    color: #BBB;
    line-height: 60px;
  }

  .empty-wrapper i {
    font-size: 148px;
  }

  #navigatorTables li {
    width: 95%;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  #navigatorSearch, #navigatorNoTables {
    display: none;
  }

  #navigator .card {
    padding-bottom: 30px;
  }

</style>

  <script type="text/javascript" charset="utf-8">

    // jHue plugins global configuration
    jHueFileChooserGlobals = {
      labels: {
        BACK: "返回",
        SELECT_FOLDER: "选择文件夹",
        CREATE_FOLDER: "创建文件夹",
        FOLDER_NAME: "文件夹名称",
        CANCEL: "取消",
        FILE_NOT_FOUND: "未找到文件",
        UPLOAD_FILE: "上传文件",
        FAILED: "失败"
      },
      user: "root"
    };

    jHueTableExtenderGlobals = {
      labels: {
        GO_TO_COLUMN: "转到列：",
        PLACEHOLDER: "列名称..."
      }
    };

    jHueTourGlobals = {
      labels: {
        AVAILABLE_TOURS: "可用导览",
        NO_AVAILABLE_TOURS: "该页面无内容。",
        MORE_INFO: "阅读更多关于它的信息...",
        TOOLTIP_TITLE: "演示教程"
      }
    };

  </script>

  <script src="/static/js/hue.utils.js"></script>
  <script src="/static/ext/js/jquery/jquery-2.0.2.min.js"></script>
  <script src="/static/js/jquery.migration.js"></script>
  <script src="/static/js/jquery.filechooser.js"></script>
  <script src="/static/js/jquery.selector.js"></script>
  <script src="/static/js/jquery.alert.js"></script>
  <script src="/static/js/jquery.rowselector.js"></script>
  <script src="/static/js/jquery.notify.js"></script>
  <script src="/static/js/jquery.tablescroller.js"></script>
  <script src="/static/js/jquery.tableextender.js"></script>
  <script src="/static/js/jquery.scrollup.js"></script>
  <script src="/static/js/jquery.tour.js"></script>
  <script src="/static/ext/js/jquery/plugins/jquery.cookie.js"></script>
  <script src="/static/ext/js/jquery/plugins/jquery.total-storage.min.js"></script>
  <script src="/static/ext/js/jquery/plugins/jquery.placeholder.min.js"></script>
  <script src="/static/ext/js/jquery/plugins/jquery.dataTables.1.8.2.min.js"></script>
  <script src="/static/js/jquery.datatables.sorting.js"></script>
  <script src="/static/ext/js/bootstrap.min.js"></script>
  <script src="/static/ext/js/fileuploader.js"></script>
  
  
	<script src="/static/ext/js/knockout-min.js" type="text/javascript" charset="utf-8"></script>
	<script src="/static/ext/js/knockout.mapping-2.3.2.js" type="text/javascript" charset="utf-8"></script>
	<script src="/etltool/static/js/etltool.vm.js"></script>
	<script src="/etltool/static/js/jCProgress-1.0.3.js"></script>
	<script src="/static/ext/js/codemirror-3.11.js"></script>
	<link rel="stylesheet" href="/static/ext/css/codemirror.css">
	<script src="/static/ext/js/codemirror-sql.js"></script>
	<script src="/static/js/codemirror-sql-hint.js"></script>
	<script src="/static/js/codemirror-show-hint.js"></script>

	<link href="/static/ext/css/bootstrap-editable.css" rel="stylesheet">
	<script src="/static/ext/js/bootstrap-editable.min.js"></script>
	<script src="/static/ext/js/bootstrap-editable.min.js"></script>

	<script src="/static/ext/js/jquery/plugins/jquery-fieldselection.js" type="text/javascript"></script>
	<script src="/etltool/static/js/autocomplete.utils.js" type="text/javascript" charset="utf-8"></script>

  <script type="text/javascript" charset="utf-8">
    $(document).ready(function () {
      // prevents framebusting and clickjacking
      if (self == top){
        $("body").show();
      }
      else {
        top.location = self.location;
      }

      $("input, textarea").placeholder();
      $(".submitter").keydown(function (e) {
        if (e.keyCode == 13) {
          $(this).closest("form").submit();
        }
      }).change(function () {
          $(this).closest("form").submit();
      });

      $(".navbar .nav-tooltip").tooltip({
        delay: 0,
        placement: "bottom"
      });

      $("[rel='tooltip']").tooltip({
        delay: 0,
        placement: "bottom"
      });

      $("[rel='navigator-tooltip']").tooltip({
        delay: 0,
        placement: "bottom"
      });

      var JB_CHECK_INTERVAL_IN_MILLIS = 30000;
      window.setTimeout(checkJobBrowserStatus, 10);

      function checkJobBrowserStatus(){
        $.getJSON("/jobbrowser/?format=json&state=running&user=root&rnd="+Math.random(), function(data){
          if (data != null){
            if (data.length > 0){
              $("#jobBrowserCount").removeClass("hide").text(data.length);
            }
            else {
              $("#jobBrowserCount").addClass("hide");
            }
          }
          window.setTimeout(checkJobBrowserStatus, JB_CHECK_INTERVAL_IN_MILLIS);
        }).fail(function () {
          window.clearTimeout(checkJobBrowserStatus);
        });
      }

      function openDropdown(which, timeout){
        var _this = which;
        var _timeout = timeout!=null?timeout:800;
        if ($(".navigator").find("ul.dropdown-menu:visible").length > 0) {
          _timeout = 10;
        }
        window.clearTimeout(closeTimeout);
        openTimeout = window.setTimeout(function () {
          $(".navigator li.open").removeClass("open");
          $(".navigator ul.dropdown-menu").hide();
          $("[rel='navigator-tooltip']").tooltip("hide");
          _this.find("ul.dropdown-menu").show();
        }, _timeout);
      }

      var openTimeout, closeTimeout;
      $(".navigator ul.nav li.dropdown").on("click", function(){
        openDropdown($(this), 10);
      });
      $(".navigator ul.nav li.dropdown").hover(function () {
        openDropdown($(this));
      },
      function () {
        var _this = $(this);
        window.clearTimeout(openTimeout);
        closeTimeout = window.setTimeout(function () {
          $(".navigator li.open").removeClass("open");
          $(".navigator li a:focus").blur();
          $(".navigator").find("ul.dropdown-menu").hide();
        }, 1000);
      });

      var _skew = -1;
      $("[data-hover]").on("mouseover", function(){
        var _this = $(this);
        _skew = window.setTimeout(function(){
          _this.attr("src", _this.data("hover"));
        }, 3000);
      });

      $("[data-hover]").on("mouseout", function(){
        $(this).attr("src", $(this).data("orig"));
        window.clearTimeout(_skew);
      });
    });
  </script>
</head>
<body>




<div class="navigator">
  <div class="pull-right">
  <ul class="nav nav-pills">
    <li class="divider-vertical"></li>
    
    
    <li class="dropdown">
      <a title="管理" rel="navigator-tooltip" href="index.html#" data-toggle="dropdown" class="dropdown-toggle"><i class="fa fa-cogs"></i>&nbsp;&nbsp;root<b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="/useradmin/users/edit/root"><i class="fa fa-key"></i>&nbsp;&nbsp;Edit Profile</a></li>
        <li><a href="/useradmin/users"><i class="fa fa-group"></i>&nbsp;&nbsp;管理用户</a></li>
      </ul>
    </li>
    <li><a title="文档" rel="navigator-tooltip" href="/help"><i class="fa fa-question-circle"></i></a></li>
    <li id="jHueTourFlagPlaceholder"></li>
    <li><a title="Sign out" rel="navigator-tooltip" href="/accounts/logout/"><i class="fa fa-sign-out"></i></a></li>
  </ul>
  </div>
    <a class="brand nav-tooltip pull-left" title="关于 Hue" rel="navigator-tooltip" href="/about"><img src="/static/art/hue-logo-mini-white.png" data-orig="/static/art/hue-logo-mini-white.png" data-hover="/static/art/hue-logo-mini-white-hover.png"/></a>
     <ul class="nav nav-pills pull-left">
       <li><a title="我的文档" rel="navigator-tooltip" href="/home" style="padding-bottom:2px!important"><i class="fa fa-home" style="font-size: 19px"></i></a></li>
       
       <li class="dropdown">
         <a rel="navigator-tooltip" href="#" data-toggle="dropdown" class="dropdown-toggle">数据源 <b class="caret"></b></a>
         <ul role="menu" class="dropdown-menu">
           <li><a href="/beeswax"><img src="/beeswax/static/art/icon_beeswax_24.png"/> Hive</a></li>
           <li><a href="/impala"><img src="/impala/static/art/icon_impala_24.png"/> Impala</a></li>
           <li><a href="/rdbms"><img src="/rdbms/static/art/icon_rdbms_24.png"/> 数据库查询</a></li>
           <li><a href="/hbase"><img src="/hbase/static/art/icon_24.png"/> HBase</a></li>
           <li><a href="/metastore"><img src="/metastore/static/art/icon_metastore_24.png"/> Metastore表</a></li>
           <li><a href="/pig"><img src="/pig/static/art/icon_pig_24.png"/> Pig</a></li>
           <li><a href="/filebrowser">文件浏览器&nbsp;</a></li>
          

         </ul>
       </li>
       
       <li>
         <a title="ETL工具" rel="navigator-tooltip" href="/etltool">ETL</a>
       </li>
       
       <li class="dropdown">
         <a rel="navigator-tooltip" href="#" data-toggle="dropdown" class="dropdown-toggle">任务设计 <b class="caret"></b></a>
         <ul role="menu" class="dropdown-menu">
           <li><a href="/oozie/"><img src="/oozie/static/art/icon_oozie_dashboard_24.png" /> 控制面板</a></li>
           <li><a href="/oozie/list_workflows/"><img src="/oozie/static/art/icon_oozie_editor_24.png" /> 编辑器</a></li>
           <li><a href="/jobsub"><img src="/jobsub/static/art/icon_jobsub_24.png"/> 作业设计器</a></li>
           <li><a href="/spark"><img src="/spark/static/art/icon_spark_24.png"/> Spark</a></li>
           <li><a href="/jobbrowser">作业浏览器&nbsp;<span id="jobBrowserCount" class="badge badge-warning hide" style="padding-top:0;padding-bottom: 0"></span></a></li>
         </ul>
       </li>
       <li>
         <a title="Solr搜索" rel="navigator-tooltip" href="/search/">搜索</a>
       </li>
       <li class="dropdown">
         <a href="#" data-toggle="dropdown" class="dropdown-toggle">其他应用程序 <b class="caret"></b></a>
         <ul role="menu" class="dropdown-menu">
             <li><a href="/etltool"><img src="/etltool/static/art/icon_etltool_24.png"/> etltool</a></li>
         </ul>
       </li>
     </ul>

</div>

<div id="jHueNotify" class="alert hide">
    <button class="close">&times;</button>
    <span class="message"></span>
</div>



  <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <div class="nav-collapse">
            <ul class="nav">
              <li class="currentApp">
                <a href="/metastore">
                  <img src="/metastore/static/art/icon_metastore_24.png" />
                 ETL工具
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
  </div>


<link rel="stylesheet" href="/metastore/static/css/metastore.css">

<div class="container-fluid">
<div class="row-fluid">
<div class="span3">
    <div class="sidebar-nav">

		
        <ul class="nav nav-list">
		<form action="/etltool/rdb_hive" id="db_form" method="POST" style="margin-bottom: 0">
          <li class="nav-header">FROM</li>
		  <li><select name="from" id="id_from" data-bind="options: viewModel.from,selectedOptions: viewModel.fromSelected"></select></li>
          <li class="nav-header">TO</li>
		  <li><select name="to" id="id_to" data-bind="options: viewModel.to,selectedOptions: viewModel.toSelected"></select></li>
        </form>		  
        </ul>

    </div>

</div>


<div class="span9  rdb_hive ">
  <div class="card card-small" style="margin-top: 0">
    <h1 class="card-heading simple">
      <ul id="breadcrumbs" class="nav nav-pills hueBreadcrumbBar">
        <li>
          <a href="/metastore/databases">ETL工具</a><span class="divider">&gt;</span>
        </li>
        <li>
          <a href="/metastore/tables/default">Traditional RDB ==> Hive</a>
        </li>
      </ul>
    </h1>
    <div class="card-body">
      <p>
        <ul class="nav nav-pills rdb_hive_ul">
          <li class="active"><a href="#rdb_hive_step0" class="rdb_hive_step">第 1 步：RDB配置</a></li>		  
          <li><a href="#rdb_hive_step1" class="rdb_hive_step">第 2 步：Hive配置</a></li>
        </ul>

        <form action="#" method="POST" id="mainForm" class="form-horizontal">
      <div class="steps">

        <div id="rdb_hive_step0" class="stepDetails">
            <fieldset>
                <div class="alert alert-info"><h3>RDB相关配置</h3>包含RDB数据源和表</div>
				
			<div class="control-group">                        
				<label for="table-field_terminator" class="control-label">RDB数据源</label>
				<div class="controls">
					<select name="table-field_terminator_0" id="rdb_hive_rdbdatabase" data-bind="options: viewModel.servers,optionsText: 'nice_name',optionsValue: 'name'">
					</select>
					<span class="help-block">
						对应字段的解释
					</span>
				</div>
			</div>
			
			<div class="control-group">                        
				<label for="table-field_terminator" class="control-label">RDB数据表</label>
				<div class="controls">
					<select name="table-field_terminator_0" id="rdb_hive_rdbtable" data-bind="options: viewModel.databases">
					</select>
					<span class="help-block">
						对应字段的解释
					</span>
				</div>
			</div>
            </fieldset>
     </div>
	  
        <div id="rdb_hive_step1" class="stepDetails hide">
            <fieldset>
                <div class="alert alert-info"><h3>Hive相关配置</h3>包含hive数据库和相应的表名</div>
			<div class="control-group">                        
				<label for="table-field_terminator" class="control-label">Hive数据库</label>
				<div class="controls">
					<select name="table-field_terminator_0" id="rdb_hive_hivedatabase" data-bind="options: viewModel.hiveDatabases">
					</select>
					<span class="help-block">
						对应字段的解释
					</span>
				</div>
			</div>			

			<div class="control-group">
				<label for="table-name" class="control-label">Hive表名</label>
				<div class="controls">
				<input data-bind="value: $root.hiveTableName" name="table-name" id="rdb_hive_hivetable"  type='text'   class=""  />
					<p class="help-block">
					默认为RDB相应表名
					</p>
				</div>
			</div>				
            </fieldset>
        </div>
      </div>
      <div class="form-actions" style="padding-left: 10px">
          <button type="button" id="rdb_hive_backBtn" class="btn hide">返回</button>
          <button type="button" id="rdb_hive_nextBtn" class="btn btn-primary">下一页</button>
		  <button type="button" id="rdb_hive_begin" class="btn btn-primary hide" data-bind="click:rdb_hive_begin">开始</button>
		  <button type="button" id="rdb_hive_stop" class="btn btn-primary hide" data-bind="click:rdb_hive_stop">停止</button>
      </div>
      </form>
	  <div class="container hide">
	    <table class="table table-striped table-condensed datatables tablescroller-disable">
          <thead>
          <tr>
            <th width="20%">Name</th>
            <th width="60%">Status</th>
            <th>Percentage</th>
          </tr>
          </thead>
		  <tbody>
            <td width="20%" data-bind="text: viewModel.processName"></th>
            <td width="60%" data-bind="text: viewModel.processStatus"></th>
            <td data-bind="text: viewModel.processPercentage"></th>
			</tobody>
        </table>
      <div class="progress  progress-striped rdb_hive_progress" style="margin-bottom: 9px;" data-bind="css: {'progress-success': viewModel.processStatus == 'SUCCEEDED', 'progress-info': viewModel.processStatus == 'RUNNING' || viewModel.processStatus == 'PREP', 'progress-danger': viewModel.processStatus == 'KILLED'||viewModel.processStatus == 'FAILED'}, attr: {'style': 'width:' + viewModel.progressPercent}">
        <div class="bar rdb_hive_bar" style="width: 0%"></div>
      </div>
    </div>
      </p>
    </div>
</div>
</div>




<div class="span9  rdb_hdfs hide">
  <div class="card card-small" style="margin-top: 0">
    <h1 class="card-heading simple">
      <ul id="breadcrumbs" class="nav nav-pills hueBreadcrumbBar">
        <li>
          <a href="/metastore/databases">ETL工具</a><span class="divider">&gt;</span>
        </li>
        <li>
          <a href="/metastore/tables/default">Traditional RDB ==> HDFS</a>
        </li>
      </ul>
    </h1>
    <div class="card-body">
      <p>
        <ul class="nav nav-pills rdb_hdfs_ul">
          <li class="active"><a href="#rdb_hdfs_step0" class="rdb_hdfs_step">第 1 步：RDB配置</a></li>		  
          <li><a href="#rdb_hdfs_step1" class="rdb_hdfs_step">第 2 步：HDFS配置</a></li>
        </ul>

        <form action="#" method="POST" id="mainForm" class="form-horizontal">
      <div class="steps">

        <div id="rdb_hdfs_step0" class="stepDetails">
            <fieldset>
                <div class="alert alert-info"><h3>RDB相关配置</h3>包含RDB数据源和表</div>
				
			<div class="control-group">                        
				<label for="table-field_terminator" class="control-label">RDB数据源</label>
				<div class="controls">
					<select name="table-field_terminator_0" id="rdb_hdfs_rdbdatabase" data-bind="options: viewModel.servers,optionsText: 'nice_name',optionsValue: 'name'">
					</select>
					<span class="help-block">
						对应字段的解释
					</span>
				</div>
			</div>
			
			<div class="control-group">                        
				<label for="table-field_terminator" class="control-label">RDB数据表</label>
				<div class="controls">
					<select name="table-field_terminator_0" id="rdb_hdfs_rdbtable" data-bind="options: viewModel.databases">
					</select>
					<span class="help-block">
						对应字段的解释
					</span>
				</div>
			</div>
            </fieldset>
     </div>
	  
        <div id="rdb_hdfs_step1" class="stepDetails hide">
            <fieldset>
                <div class="alert alert-info"><h3>HDFS相关配置</h3>导出文件在HDFS上的存储位置</div>
			<div class="control-group hide">                        
				<label for="table-field_terminator" class="control-label">Hive数据库</label>
				<div class="controls">
					<select name="table-field_terminator_0" id="hivedatabase" data-bind="options: viewModel.hiveDatabases">
					</select>
					<span class="help-block">
						对应字段的解释
					</span>
				</div>
			</div>			

			<div class="control-group hide">
				<label for="table-name" class="control-label">Hive表名</label>
				<div class="controls">
				<input data-bind="value: $root.hiveTableName" name="table-name" id="hivetable"  type='text'   class=""  />
					<p class="help-block">
					默认为RDB相应表名
					</p>
				</div>
			</div>

            <div id="location" class="control-group">
             <label for="table-external_location" class="control-label">External location</label>
			<div class="controls">
                <input name="table-external_location" value="" type='text' id='data_dir'  class="pathChooser input-xxlarge" placeholder="/user/user_name/data_dir" /><a class="btn fileChooserBtn" href="#" data-filechooser-destination="table-external_location">...</a>
                <span class="help-block">
                        RDB数据导出的路径（位于 HDFS 上）,<FONT SIZE=3 color="#FF0000">需要新建，不能为已有目录</font>
                        </span>
                    </div>
                </div>			
            </fieldset>
        </div>
      </div>
      <div class="form-actions" style="padding-left: 10px">
          <button type="button" id="rdb_hdfs_backBtn" class="btn hide">返回</button>
          <button type="button" id="rdb_hdfs_nextBtn" class="btn btn-primary">下一页</button>
		  <button type="button" id="rdb_hdfs_begin" class="btn btn-primary hide" data-bind="click:rdb_hive_begin">开始</button>
		  <button type="button" id="rdb_hdfs_stop" class="btn btn-primary hide" data-bind="click:rdb_hive_stop">停止</button>
      </div>
      </form>
	  <div class="container hide">
	    <table class="table table-striped table-condensed datatables tablescroller-disable">
          <thead>
          <tr>
            <th width="20%">Name</th>
            <th width="60%">Status</th>
            <th>Percentage</th>
          </tr>
          </thead>
		  <tbody>
            <td width="20%" data-bind="text: viewModel.processName"></th>
            <td width="60%" data-bind="text: viewModel.processStatus"></th>
            <td data-bind="text: viewModel.processPercentage"></th>
			</tobody>
        </table>
      <div class="progress progress-info progress-striped" style="margin-bottom: 9px;" data-bind="css: {'bar-success': viewModel.status == 'SUCCEEDED', 'bar-warning': viewModel.status == 'RUNNING' || viewModel.status == 'PREP', 'bar-danger': status != 'RUNNING' && status != 'SUCCEEDED' && status != 'OK' && status != 'PREP' && status != 'SUSPENDED'}, attr: {'style': 'width:' + viewModel.progressPercent}">
        <div class="bar" style="width: 0%"></div>
      </div>
    </div>
      </p>
    </div>
</div>
</div>



<div class="span9  other hide">
  <div class="card card-small" style="margin-top: 0">
    <h1 class="card-heading simple">
      <ul id="breadcrumbs" class="nav nav-pills hueBreadcrumbBar">
        <li>
          <a href="/metastore/databases">ETL工具</a><span class="divider">&gt;</span>
        </li>
        <li>
          <a href="/metastore/tables/default">当前不支持！！！！！！！！！！！！</a>
        </li>
      </ul>
    </h1>
</div>
</div>




</div>
</div>









<div id="chooseFile" class="modal hide fade">
    <div class="modal-header">
        <a href="#" class="close" data-dismiss="modal">&times;</a>
        <h3>选择文件</h3>
    </div>
    <div class="modal-body">
        <div id="filechooser">
        </div>
    </div>
    <div class="modal-footer">
    </div>
</div>

<style type="text/css">
  #filechooser {
    min-height: 100px;
    overflow-y: auto;
    margin-top: 10px;
    height: 250px;
  }

  .inputs-list {
    list-style: none outside none;
    margin-left: 0;
  }

  .remove {
    float: right;
  }

  .error-inline {
    color: #B94A48;
    font-weight: bold;
  }

  .steps {
  }

  div .alert {
    margin-bottom: 30px;
  }
</style>

</div>

<script type="text/javascript" charset="utf-8">
$(document).ready(function () {
  $("#chooseDatabase").on("change", function () {
    window.location.href = $(this).val();
  });
  if ($(".removeBtn").length == 1) {
    $(".removeBtn").first().hide();
  }

  $(".fileChooserBtn").click(function (e) {
    e.preventDefault();
    var _destination = $(this).attr("data-filechooser-destination");
    $("#filechooser").jHueFileChooser({
      initialPath: $("input[name='" + _destination + "']").val(),
      onFolderChoose: function (filePath) {
        $("input[name='" + _destination + "']").val(filePath);
        $("#chooseFile").modal("hide");
      },
      createFolder: false,
      selectFolder: true,
      uploadFile: false
    });
    $("#chooseFile").modal("show");
  });

  $(".rdb_hive_step").click(function (event) {	
    event.preventDefault();
    if (validateForm()) {
      $(".stepDetails").hide();
      var _step = $(this).attr("href");
      $(_step).css("visibility", "visible").show();
      $("#backBtn").hide();
      if (_step != "#rdb_hive_step1") {
        $("#rdb_hive_nextBtn").css("visibility", "visible").show();
        $("#rdb_hive_begin").hide();
		$("#rdb_hive_backBtn").hide();	  
      }
      if (_step != "#rdb_hive_step0") {
        $("#rdb_hive_backBtn").css("visibility", "visible").show();
		$("#rdb_hive_begin").css("visibility", "visible").show();
		$("#rdb_hive_nextBtn").hide();
      }
      $(".rdb_hive_step").parent().removeClass("active");
      $(this).parent().addClass("active");
    }
  });

  $("#rdb_hive_nextBtn").click(function () {
    $("ul.rdb_hive_ul li.active").next().find("a").click();
  });

  $("#rdb_hive_backBtn").click(function () {
    $("ul.rdb_hive_ul li.active").prev().find("a").click();
  });

  
    $(".rdb_hdfs_step").click(function (event) {	
    event.preventDefault();
    if (validateForm()) {
      $(".stepDetails").hide();
      var _step = $(this).attr("href");
      $(_step).css("visibility", "visible").show();
      $("#backBtn").hide();
      if (_step != "#rdb_hdfs_step1") {
        $("#rdb_hdfs_nextBtn").css("visibility", "visible").show();
        $("#rdb_hdfs_begin").hide();
		$("#rdb_hdfs_backBtn").hide();	  
      }
      if (_step != "#rdb_hdfs_step0") {
        $("#rdb_hdfs_backBtn").css("visibility", "visible").show();
		$("#rdb_hdfs_begin").css("visibility", "visible").show();
		$("#rdb_hdfs_nextBtn").hide();
      }
      $(".rdb_hdfs_step").parent().removeClass("active");
      $(this).parent().addClass("active");
    }
  });

  $("#rdb_hdfs_nextBtn").click(function () {
    $("ul.rdb_hdfs_ul li.active").next().find("a").click();
  });

  $("#rdb_hdfs_backBtn").click(function () {
    $("ul.rdb_hdfs_ul li.active").prev().find("a").click();
  });
  

  var _url = location.href;
  if (_url.indexOf("#") > -1) {
    $(".rdb_hive_step[href='" + _url.substring(_url.indexOf("#"), _url.length) + "']").click();
  }



  function validateForm() {
    return true;
  }

  function isValid(str) {
    // validates against empty string and no spaces
    return (str != "" && str.indexOf(" ") == -1);
  }

  function showFieldError(field) {
    field.nextAll(".error-inline").not(".error-inline-bis").removeClass("hide");
  }

  function showSecondFieldError(field) {
    field.nextAll(".error-inline-bis").removeClass("hide");
  }

  function hideFieldError(field) {
    if (!(field.nextAll(".error-inline").hasClass("hide"))) {
      field.nextAll(".error-inline").addClass("hide");
    }
  }

  function hideSecondFieldError(field) {
    if (!(field.nextAll(".error-inline-bis").hasClass("hide"))) {
      field.nextAll(".error-inline-bis").addClass("hide");
    }
  }
});
</script>




<script type="text/javascript">
  $(document).ready(function () {
    $(document).on("info", function (e, msg) {
      $.jHueNotify.info(msg);
    });
    $(document).on("warn", function (e, msg) {
      $.jHueNotify.warn(msg);
    });
    $(document).on("error", function (e, msg) {
      $.jHueNotify.error(msg);
    });


    $(".dataTables_wrapper").jHueTableScroller();
    var resetTimeout = -1;
    var pendingRequestsInterval = -1;

    // sets feedback on every primary and danger action across Hue
    // can be disabled adding the class "disable-feedback" to the button
    $(document).on("click", ".btn-primary:not(.disable-feedback), .btn-danger:not(.disable-feedback)", function () {
      if (!$(this).hasClass('disabled')) {
        var text = ($(this).text() != "") ? $(this).text() : $(this).val();
        $(this).attr("data-loading-text", text + " ...");
        $(this).button("loading");
        resetTimeout = window.setTimeout(function () {
          resetPrimaryButtonsStatus();
        }, 200);
      }
    });

    $(document).on("hidden", ".modal", function () {
      resetPrimaryButtonsStatus();
    });

    $(window).unload(function () {
      window.clearInterval(pendingRequestsInterval);
      window.clearTimeout(resetTimeout);
    });

    $(document).on("submit", "form", function () {
      hasAjaxBeenSent = false;
      window.setInterval(function () {
        window.clearTimeout(resetTimeout);
      }, 10);
    });

    var hasAjaxBeenSent = false;
    $(document).ajaxSend(function () {
      hasAjaxBeenSent = true;
    });

        $.jHueTour({});
        if ($.totalStorage("jHueTourExtras") != null) {
          $.jHueTour({tours: $.totalStorage("jHueTourExtras")});
        }
        var _qs = location.search;
        if (_qs !== undefined && _qs.indexOf("tour=") > -1) {
          $.jHueTour(getParameterByName("tour"), 1);
        }
        function getParameterByName(name) {
          name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
          var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                  results = regex.exec(_qs);
          return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }
  });

  function resetPrimaryButtonsStatus() {
    $(".btn-primary:not(.disable-feedback), .btn-danger:not(.disable-feedback)").button("reset");
  }

  var _catchEnterKeyOnModals = false;

  $(".modal").on("shown", function () {
    _catchEnterKeyOnModals = true;
    // safe ux enhancement: focus on the first editable input
    $(".modal:visible").find("input:visible:first").focus();
  });

  $(".modal").on("hidden", function () {
    _catchEnterKeyOnModals = false;
  });

  $(document).on("keyup", function (e) {
    var _code = (e.keyCode ? e.keyCode : e.which);
    if (_catchEnterKeyOnModals && $(".modal").is(":visible") && _code == 13) {
      var _currentModal = $(".modal:visible");
      if (_currentModal.find(".btn-primary").length > 0) {
        _currentModal.find(".btn-primary").click();
      }
      else if (_currentModal.find(".btn-danger").length > 0) {
        _currentModal.find(".btn-danger").click();
      }
    }
  });


      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-40351920-1']);

      // We collect only 2 path levels: not hostname, no IDs, no anchors...
      var _pathName = location.pathname;
      var _splits = _pathName.substr(1).split("/");
      _pathName = _splits[0] + (_splits.length > 1 && $.trim(_splits[1]) != "" ? "/" + _splits[1] : "");

      _gaq.push(['_trackPageview', '/remote/3.5.0/' + _pathName]);

      (function () {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
      })();

      function trackOnGA(path) {
        if (typeof _gaq != "undefined" && _gaq != null) {
          _gaq.push(['_trackPageview', '/remote/3.5.0/' + path]);
        }
      }


</script>
  

<script type="text/javascript">
  viewModel = new RdbmsViewModel();
  viewModel.fetchServers();
  viewModel.fetchHiveDatabases();
  if($.totalStorage('selectedFrom')){viewModel.fromSelected=ko.observableArray([$.totalStorage('selectedFrom')]);}
  if($.totalStorage('selectedTo')){viewModel.toSelected=ko.observableArray([$.totalStorage('selectedTo')]);}
  ko.applyBindings(viewModel);
function rdb_hive_begin(){
	$('#rdb_hive_begin').attr('disabled',"true");
	$("#rdb_hive_stop").css("visibility", "visible").show();
	startProcess();
	$('.container').removeClass('hide');
	var data={
		rdbdatabase:$('#rdb_hive_rdbdatabase').val(),
		rdbtable:$('#rdb_hive_rdbtable').val(),
		hivedatabase:$('#rdb_hive_hivedatabase').val(),
		hivetable:$('#rdb_hive_hivetable').val()
	}
    var request = {
      url: 'http://10.60.1.149:4567/etl/rdbtohive?userid=1',
      dataType: 'jsonp',
	  jsonp:'jsonpcallback',
	  jsonpcallback:'skycallback',
      type: 'GET',
      success: function(data) {
	  viewModel.jobId(data.logid);
      },
      data: data
    };
    $.ajax(request);
  };
  
	function beforeETL(){
		$.totalStorage('selectedFrom', viewModel.fromSelected());
		$.totalStorage('selectedTo', viewModel.toSelected());
		$('.span9').addClass('hide');
		if(viewModel.fromSelected()=='Traditional RDB'){
			if(viewModel.toSelected()=='Hive'){
				$('.rdb_hive').removeClass('hide');
				$("ul.rdb_hive_ul li.active").find("a").click();
			}else {
				if(viewModel.toSelected()=='HDFS'){$('.rdb_hdfs').removeClass('hide');$("ul.rdb_hdfs_ul li.active").find("a").click();}else{$('.other').removeClass('hide');}
			}
		}else{
			$('.other').removeClass('hide');
		}
		
	}
 function rdb_hive_stop(){
	$('#rdb_hive_stop').hide();
	$('#rdb_hive_begin').removeAttr("disabled");
	var data={
		rdbdatabase:$('#rdb_hive_rdbdatabase').val(),
		rdbtable:$('#rdb_hive_rdbtable').val(),
		hivedatabase:$('#rdb_hive_hivedatabase').val(),
		hivetable:$('#rdb_hive_hivetable').val()
	}
    var request = {
      url: 'http://10.60.1.149:4567/etl/killjob/'+viewModel.jobId()+'?userid=1',
      dataType: 'jsonp',
	  jsonp:'jsonpcallback',
	  jsonpcallback:'skycallback',
      type: 'GET',
      success: function(data) {
			window.clearInterval(progressInterval);
			viewModel.processStatus('KILLED');
			viewModel.processName('RDB->Hive');
			viewModel.processPercentage('100%');
			$('.rdb_hive_bar').css('width','100%');
			$.jHueNotify.info("成功停止当前ETL任务！");
			$('.rdb_hive_progress').removeClass('progress-info');
			$('.rdb_hive_progress').removeClass('progress-success');
			$('.rdb_hive_progress').addClass('progress-danger');
			//$(document).trigger('server.error', data.message);
      },
      data: data
    };
    $.ajax(request);
  }; 
  
    function startProcess() {
		progressInterval = window.setInterval(function () {
		var request = {
		  url: 'http://10.60.1.149:4567/etl/jobprocess/'+viewModel.jobId()+'?userid=1',
		  dataType:'jsonp',
		  jsonp:'jsonpcallback',
		  jsonpcallback:'skycallback',
		  type: 'GET',
		  success: function(data) {
			if (data.status === 0) {
				viewModel.processStatus('PREP');
				viewModel.processPercentage('0%');
			    $('.rdb_hive_bar').css('width',0);
			} else if (data.status === 1){
			viewModel.processStatus('RUNNING');
			viewModel.processName('RDB->Hive:Map');
			viewModel.processPercentage(data.process+'%');
			$('.rdb_hive_progress').removeClass('progress-success');
			$('.rdb_hive_progress').removeClass('progress-danger');
			$('.rdb_hive_progress').addClass('progress-info');
			$('.rdb_hive_bar').css('width',viewModel.processPercentage());			
			} else if (data.status === 2){
			viewModel.processStatus('RUNNING');
			viewModel.processName('RDB->Hive:Reduce');
			viewModel.processPercentage(data.process+'%');
			$('.rdb_hive_bar').css('width',viewModel.processPercentage());
			$('.rdb_hive_progress').removeClass('progress-success');
			$('.rdb_hive_progress').removeClass('progress-danger');
			$('.rdb_hive_progress').addClass('progress-info');			
			} else if (data.status === 3){
			viewModel.processStatus('SUCCEEDED');
			viewModel.processName('RDB->Hive');
			viewModel.processPercentage('100%');
			$('.rdb_hive_bar').css('width',viewModel.processPercentage());	
			window.clearInterval(progressInterval);	
			 $.jHueNotify.info("导出成功！");
			$('.rdb_hive_progress').removeClass('progress-info');
			$('.rdb_hive_progress').removeClass('progress-danger');
			$('.rdb_hive_progress').addClass('progress-success');
			} else{
			window.clearInterval(progressInterval);
			viewModel.processStatus('FAILED');
			viewModel.processName('RDB->Hive');
			viewModel.processPercentage('100%');
			$('.rdb_hive_progress').removeClass('progress-info');
			$('.rdb_hive_progress').removeClass('progress-success');
			$('.rdb_hive_progress').addClass('progress-danger');
			$('.rdb_hive_bar').css('width',viewModel.processPercentage());	
			$(document).trigger('server.error', data.message);
			}
		  },
		};
		$.ajax(request);
      }, 2000);
    }
    $("#rdb_hive_rdbdatabase").change(function () {
	var name=$(this).val();
    $.each(viewModel.servers(), function(index, server) {
      if (server.name() == name) {
        viewModel.selectedServer(index);
      }
    });
    $.totalStorage('hueRdbmsLastServer', viewModel.server().name());
    viewModel.fetchDatabases();

    });
	$("#id_to").change(function () {
	var name=$(this).val();
	$.totalStorage('selectedTo', name);
			$('.span9').addClass('hide');
		if(viewModel.fromSelected()=='Traditional RDB'){
			if(viewModel.toSelected()=='Hive'){
				$('.rdb_hive').removeClass('hide');
				$("ul.rdb_hive_ul li.active").find("a").click();
			}else {
				if(viewModel.toSelected()=='HDFS'){$('.rdb_hdfs').removeClass('hide');$("ul.rdb_hdfs_ul li.active").find("a").click();}else{$('.other').removeClass('hide');}
			}
		}else{
			$('.other').removeClass('hide');
		}
	
    });
	$("#id_from").change(function () {
	var name=$(this).val();
	$.totalStorage('selectedFrom', name);
			$('.span9').addClass('hide');
		if(viewModel.fromSelected()=='Traditional RDB'){
			if(viewModel.toSelected()=='Hive'){
				$('.rdb_hive').removeClass('hide');
				$("ul.rdb_hive_ul li.active").find("a").click();
			}else {
				if(viewModel.toSelected()=='HDFS'){$('.rdb_hdfs').removeClass('hide');$("ul.rdb_hdfs_ul li.active").find("a").click();}else{$('.other').removeClass('hide');}
			}
		}else{
			$('.other').removeClass('hide');
		}
    });
    $("#rdb_hive_rdbtable").change(function () {
		viewModel.hiveTableName($(this).val());
    });
	
	

</script>
</body>
</html>

