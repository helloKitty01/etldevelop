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
       
       <li class="dropdown">
         <a rel="navigator-tooltip" href="#" data-toggle="dropdown" class="dropdown-toggle">ETL工具 <b class="caret"></b></a>
         <ul role="menu" class="dropdown-menu">
           <li><a href="/sqoop"><img src="/sqoop/static/art/icon_sqoop_24.png"/> Sqoop调度</a></li>
         </ul>
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
            <li class="nav-header">操作</li>
            <li><a href="/etltool/rdb_hdfs"><i class="fa fa-wrench"></i> Traditional RDB ==> HDFS</a></li>
            <li><a href="/etltool/rdb_hive"><i class="fa fa-wrench"></i> Traditional RDB ==> Hive</a></li>
			<li><a href="#"><i class="fa fa-wrench"></i> Hive ==> Traditional</a></li>
			<li><a href="#"><i class="fa fa-wrench"></i> Local File System ==> HDFS</a></li>
			<li><a href="#"><i class="fa fa-wrench"></i> HDFS ==> Local File System</a></li>
			<li><a href="#"><i class="fa fa-wrench"></i> Local File System ==> HBase</a></li>
			<li><a href="#"><i class="fa fa-wrench"></i> HBase ==> Local File System</a></li>
        </ul>
    </div>
</div>

<div class="span9">
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
        <ul class="nav nav-pills">
          <li class="active"><a href="#step0" class="step">第 1 步：RDB配置</a></li>		  
          <li><a href="#step1" class="step">第 2 步：HDFS配置</a></li>
        </ul>

        <form action="#" method="POST" id="mainForm" class="form-horizontal">
      <div class="steps">

        <div id="step0" class="stepDetails">
            <fieldset>
                <div class="alert alert-info"><h3>RDB相关配置</h3>包含RDB数据源和表</div>
				
			<div class="control-group">                        
				<label for="table-field_terminator" class="control-label">RDB数据源</label>
				<div class="controls">
					<select name="table-field_terminator_0" id="rdbdatabase" data-bind="options: viewModel.servers,optionsText: 'nice_name',optionsValue: 'name'">
					</select>
					<span class="help-block">
						对应字段的解释
					</span>
				</div>
			</div>
			
			<div class="control-group">                        
				<label for="table-field_terminator" class="control-label">RDB数据表</label>
				<div class="controls">
					<select name="table-field_terminator_0" id="rdbtable" data-bind="options: viewModel.databases">
					</select>
					<span class="help-block">
						对应字段的解释
					</span>
				</div>
			</div>
			
			

            </fieldset>
     </div>
	  
        <div id="step1" class="stepDetails hide">
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
                        RDB数据导出的路径（位于 HDFS 上）
                        </span>
                    </div>
                </div>			
            </fieldset>
        </div>

        <div id="step2" class="stepDetails hide">
            <fieldset>
                <div class="alert alert-info"><h3>选择您的记录格式</h3>
                    Individual records are broken up into columns either with delimiters (e.g., CSV or TSV) or using a specific serialization/deserialization (SerDe) implementation. (One common specialized SerDe is for parsing out columns with a regular expression.)
                </div>
                
                <div class="control-group">
                    <label class="control-label" id="formatRadio">记录格式</label>
                    <div class="controls">
                        <label class="radio">
                            <input type="radio" name="table-row_format" value="Delimited"
                                   checked
                                    >
                            已分隔
                            <span class="help-inline">
                            （数据文件使用分隔符，如逗号 (CSV) 或制表符。）
                            </span>
                        </label>
                        <label class="radio">
                            <input type="radio" name="table-row_format" value="SerDe"
                                    >
                            SerDe
                            <span class="help-inline">
                            （输入一个专用的序列化实施。）
                            </span>
                        </label>
                    </div>
                </div>
            </fieldset>
        </div>

        <div id="step3" class="stepDetails hide">
            <fieldset>
                <div id="step3Delimited" class="stepDetailsInner">
                    <div class="alert alert-info"><h3>配置记录序列</h3>
                        仅支持单字符分隔符。
                    </div>
                    <div class="control-group">
                        
    <label for="table-field_terminator" class="control-label">字段终止符</label>

                        <div class="controls">
                            

            <select name="table-field_terminator_0" id="id_table-field_terminator_0">
<option value="\001" selected="selected">&#39;^A&#39; (\001)</option>
<option value="\002">&#39;^B&#39; (\002)</option>
<option value="\003">&#39;^C&#39; (\003)</option>
<option value="\t">Tab (\t)</option>
<option value=",">Comma (,)</option>
<option value=" ">Space</option>
<option value="__other__">Other...</option>
</select><input type="text" name="table-field_terminator_1" id="id_table-field_terminator_1" />

                            <span  class="help-inline error-inline hide">此字段为必填字段。不允许有空格。终止符必须严格要求为一个字符。</span>
                            <span class="help-block">
                                Enter the column delimiter. Must be a single character. Use syntax like &quot;\001&quot; or &quot;\t&quot; for special characters.
                            </span>
                        </div>
                    </div>
                    <div class="control-group">
                        
    <label for="table-collection_terminator" class="control-label">集合终结符</label>

                        <div class="controls">
                            

            <select name="table-collection_terminator_0" id="id_table-collection_terminator_0">
<option value="\001">&#39;^A&#39; (\001)</option>
<option value="\002" selected="selected">&#39;^B&#39; (\002)</option>
<option value="\003">&#39;^C&#39; (\003)</option>
<option value="\t">Tab (\t)</option>
<option value=",">Comma (,)</option>
<option value=" ">Space</option>
<option value="__other__">Other...</option>
</select><input type="text" name="table-collection_terminator_1" id="id_table-collection_terminator_1" />

                            <span  class="help-inline error-inline hide">此字段为必填字段。不允许有空格。终止符必须严格要求为一个字符。</span>
                            <span class="help-block">
                                用于数组类型。
                            </span>
                        </div>
                    </div>
                    <div class="control-group">
                        
    <label for="table-map_key_terminator" class="control-label">Map 键终止符</label>

                        <div class="controls">
                            

            <select name="table-map_key_terminator_0" id="id_table-map_key_terminator_0">
<option value="\001">&#39;^A&#39; (\001)</option>
<option value="\002">&#39;^B&#39; (\002)</option>
<option value="\003" selected="selected">&#39;^C&#39; (\003)</option>
<option value="\t">Tab (\t)</option>
<option value=",">Comma (,)</option>
<option value=" ">Space</option>
<option value="__other__">Other...</option>
</select><input type="text" name="table-map_key_terminator_1" id="id_table-map_key_terminator_1" />

                            <span  class="help-inline error-inline hide">此字段为必填字段。不允许有空格。终止符必须严格要求为一个字符。</span>
                            <span class="help-block">
                                用于 map 类型。
                            </span>
                        </div>
                    </div>
                </div>
                <div id="step3SerDe" class="hide stepDetailsInner">
                    <div class="alert alert-info"><h3>配置记录序列</h3>
                    </div>
                    <div class="control-group">
                        
    <label for="table-serde_name" class="control-label">SerDe 名称</label>

                        <div class="controls">
                            

                    <input name="table-serde_name" value="" type='text' placeholder='com.acme.hive.SerDe'  class=""  />

                            <span class="help-block">
                                SerDe 的 Java 类名称。 <em>例如</em>, org.apache.hadoop.hive.contrib.serde2.RegexSerDe
                            </span>
                        </div>
                    </div>
                    <div class="control-group">
                        
    <label for="table-serde_properties" class="control-label">Serde properties</label>

                        <div class="controls">
                            

                    <input name="table-serde_properties" value="" type='text' placeholder='"prop" = "value", "prop2" = "value2"'  class=""  />

                            <span class="help-block">
                                要传递给（反）序列化机制的属性。 <em>例如,</em>, "input.regex" = "([^ ]*) ([^ ]*) ([^ ]*) (-|\\[[^\\]]*\\]) ([^ \"]*|\"[^\"]*\") (-|[0-9]*) (-|[0-9]*)(?: ([^ \"]*|\"[^\"]*\") ([^ \"]*|\"[^\"]*\"))?", "output.format.string" = "%1$s %2$s %3$s %4$s %5$s %6$s %7$s %8$s %9$s"
                            </span>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>

        <div id="step4" class="stepDetails hide">
            <fieldset>
                <div class="alert alert-info"><h3>选择文件格式</h3>
                    使用 <strong>TextFile</strong> 用于换行分隔的文本文件。
                    使用 <strong>SequenceFile</strong> 用于 Hadoop 的二进制序列化格式。
                    使用 <strong>InputFormat</strong> 以选择自定义实现。
                    <br/>
                </div>

                <div class="control-group">
                    <label id="fileFormatRadio" class="control-label">文件格式</label>
                    <div class="controls">
                        

            <ul>
<li><label for="id_table-file_format_0"><input checked="checked" type="radio" id="id_table-file_format_0" value="TextFile" name="table-file_format" /> TextFile</label></li>
<li><label for="id_table-file_format_1"><input type="radio" id="id_table-file_format_1" value="SequenceFile" name="table-file_format" /> SequenceFile</label></li>
<li><label for="id_table-file_format_2"><input type="radio" id="id_table-file_format_2" value="InputFormat" name="table-file_format" /> InputFormat</label></li>
</ul>

                    </div>
                </div>
                <div id="inputFormatDetails" class="hide">
                    <div class="control-group">
                        
    <label for="table-input_format_class" class="control-label">InputFormat 类</label>

                        <div class="controls">
                            

                    <input name="table-input_format_class" value="" type='text' placeholder='com.acme.data.MyInputFormat'  class=""  />

                            <span  class="help-inline error-inline hide">此字段为必填字段。不允许有空格。</span>
                            <span class="help-block">
                                Java class used to read data.
                            </span>
                        </div>
                    </div>
                    <div class="control-group">
                        
    <label for="table-output_format_class" class="control-label">OutputFormat 类</label>

                        <div class="controls">
                            

                    <input name="table-output_format_class" value="" type='text' placeholder='com.acme.data.MyOutputFormat'  class=""  />

                            <span  class="help-inline error-inline hide">此字段为必填字段。不允许有空格。</span>
                            <span class="help-block">
                                Java class used to write data.
                            </span>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>

        <div id="step5" class="stepDetails hide">
            <fieldset>
                <div class="alert alert-info"><h3>选择表数据的存储位置</h3>
                </div>
                <div class="control-group">
                    <label class="control-label">位置</label>
                    <div class="controls">
                        <label class="checkbox">
                            

            <input checked="checked" type="checkbox" name="table-use_default_location" id="id_table-use_default_location" />

                            使用默认位置
                        </label>
                        <span class="help-block">
                            将表存储在默认位置（由 Hive 控制，通常 <em>/user/hive/warehouse/table_name</em>).
                        </span>
                    </div>
                </div>

                <div id="location" class="control-group hide">
                    
    <label for="table-external_location" class="control-label">External location</label>

                    <div class="controls">
                        

                    <input name="table-external_location" value="" type='text'  class="pathChooser input-xxlarge" placeholder="/user/user_name/data_dir" /><a class="btn fileChooserBtn" href="#" data-filechooser-destination="table-external_location">..</a>

                        <span class="help-block">
                        输入表数据位置的路径（位于 HDFS 上）
                        </span>
                    </div>
                </div>
            </fieldset>
        </div>

        <div id="step6" class="stepDetails hide">
            <fieldset>
                <div class="alert alert-info"><h3>配置表列</h3>
                </div>
                    
    <div class="cnt well">
        <div class="remove">
        

                <button name="columns-0-_deleted" type='submit' class='btn btn-mini removeBtn' title='删除此列'  value="True"/>x</button>

        </div>
        <div class="control-group">
            <label class="control-label">列名</label>
            <div class="controls">
                <input class="column" name="columns-0-column_name" value="" placeholder="列名称"/>
                <span  class="help-inline error-inline hide">此字段为必填字段。不允许有空格。</span>
                <span  class="help-inline error-inline error-inline-bis hide">另一个字段具有相同名称。</span>
                <span class="help-block">
                列名称必须是以字母或数字开始的单个单词。
                </span>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label">列类型</label>
            <div class="controls columnType">
            

            <select name="columns-0-column_type" id="id_columns-0-column_type">
<option value="string">string</option>
<option value="tinyint">tinyint</option>
<option value="smallint">smallint</option>
<option value="int">int</option>
<option value="bigint">bigint</option>
<option value="boolean">boolean</option>
<option value="float">float</option>
<option value="double">double</option>
<option value="array">array</option>
<option value="map">map</option>
<option value="timestamp">timestamp</option>
</select>

            <span class="help-block">
            此列的类型。此界面不呈现某些高级类型（即 structs）。
            </span>
            </div>
        </div>
                <div class="arraySpec hide">
                    <div class="control-group">
                        <label class="control-label">数组值类型</label>
                        <div class="controls">
                        

            <select name="columns-0-array_type" id="id_columns-0-array_type">
<option value="string">string</option>
<option value="tinyint">tinyint</option>
<option value="smallint">smallint</option>
<option value="int">int</option>
<option value="bigint">bigint</option>
<option value="boolean">boolean</option>
<option value="float">float</option>
<option value="double">double</option>
<option value="timestamp">timestamp</option>
</select>

                            <span class="help-block">
                            数组值的类型。
                            </span>
                        </div>
                    </div>
                </div>
                <div class="mapSpec hide">
                    <div class="control-group">
                        <label class="control-label">Map 键类型</label>
                        <div class="controls">
                        

            <select name="columns-0-map_key_type" id="id_columns-0-map_key_type">
<option value="string">string</option>
<option value="tinyint">tinyint</option>
<option value="smallint">smallint</option>
<option value="int">int</option>
<option value="bigint">bigint</option>
<option value="boolean">boolean</option>
<option value="float">float</option>
<option value="double">double</option>
<option value="timestamp">timestamp</option>
</select>

                            <span class="help-inline">
                            Map 键的类型。
                            </span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Map 值类型</label>
                        <div class="controls">
                        

            <select name="columns-0-map_value_type" id="id_columns-0-map_value_type">
<option value="string">string</option>
<option value="tinyint">tinyint</option>
<option value="smallint">smallint</option>
<option value="int">int</option>
<option value="bigint">bigint</option>
<option value="boolean">boolean</option>
<option value="float">float</option>
<option value="double">double</option>
<option value="timestamp">timestamp</option>
</select>

                            <span class="help-inline">
                            Map 值的类型。
                            </span>
                        </div>
                    </div>
                </div>
    <input type="hidden" name="columns-0-_exists" value="True" id="id_columns-0-_exists" />

    </div>


                <div class="hide">
                    <tr><th><label for="id_columns-add">添加一列:</label></th><td><button type="submit" name="columns-add" value="True" id="id_columns-add">添加一列</button><input type="hidden" name="columns-next_form_id" value="1" id="id_columns-next_form_id" /></td></tr>
                </div>
                <button class="btn addColumnBtn" value="True" name="columns-add" type="submit">添加一列</button>
            </fieldset>
            <br/><br/>
            <fieldset>
                <div class="alert alert-info"><h3>配置分区</h3>
                    如果您的数据本身已分区（例如，按日期），则分区是一种告诉查询服务器特定分区值的数据将存储在一起的方式。
                    查询服务器在磁盘上的目录之间建立 mapping
                    (<em>例如,</em> <code>/user/hive/warehouse/logs/dt=20100101/</code>)
                    以及该日的数据。分区是虚拟列；数据本身中并不反映分区，而是由数据位置决定。查询服务器实施查询优化，以使特定于单个分区的查询不需要读取其他分区中的数据。
                </div>
                <div class="hide">
                    <tr><th><label for="id_partitions-add">添加一个分区:</label></th><td><button type="submit" name="partitions-add" value="True" id="id_partitions-add">添加一个分区</button><input type="hidden" name="partitions-next_form_id" value="0" id="id_partitions-next_form_id" /></td></tr>
                </div>
                <button class="btn addPartitionBtn" value="True" name="partitions-add" type="submit">添加一个分区</button>
            </fieldset>
        </div>
      </div>
      <div class="form-actions" style="padding-left: 10px">
          <button type="button" id="backBtn" class="btn hide">返回</button>
          <button type="button" id="nextBtn" class="btn btn-primary">下一页</button>
		  <button type="button" id="begin" class="btn btn-primary hide" data-bind="click:begin">开始</button>
      </div>
      </form>
      </p>
    </div>
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
    min-height: 350px;
    margin-top: 10px;
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

  $(".step").click(function (event) {	
    event.preventDefault();
    if (validateForm()) {
      $(".stepDetails").hide();
      var _step = $(this).attr("href");
      $(_step).css("visibility", "visible").show();
      $("#backBtn").hide();
      if (_step != "#step1") {
        $("#nextBtn").css("visibility", "visible").show();
        $("#begin").hide();
		$("#backBtn").hide();	  
      }
      if (_step != "#step0") {
        $("#backBtn").css("visibility", "visible").show();
		$("#begin").css("visibility", "visible").show();
		$("#nextBtn").hide();
      }
      $(".step").parent().removeClass("active");
      $(this).parent().addClass("active");
    }
  });

  $("#nextBtn").click(function () {
    $("ul.nav-pills li.active").next().find("a").click();
  });

  $("#backBtn").click(function () {
    $("ul.nav-pills li.active").prev().find("a").click();
  });

  $("#submit").click(function (event) {
    // validate step 6
    if (! validateStep6()) {
      event.preventDefault();
    }
  });

  var _url = location.href;
  if (_url.indexOf("#") > -1) {
    $(".step[href='" + _url.substring(_url.indexOf("#"), _url.length) + "']").click();
  }

  $("#id_table-field_terminator_1").css("margin-left", "4px").attr("placeholder", "此处输入您的字段终止符").hide();
  $("#id_table-field_terminator_0").change(function () {
    if ($(this).val() == "__other__") {
      $("#id_table-field_terminator_1").show();
    }
    else {
      $("#id_table-field_terminator_1").hide().nextAll(".error-inline").addClass("hide");
    }
  });
  $("#id_table-collection_terminator_1").css("margin-left", "4px").attr("placeholder", "此处输入您的集合终止符").hide();
  $("#id_table-collection_terminator_0").change(function () {
    if ($(this).val() == "__other__") {
      $("#id_table-collection_terminator_1").show();
    }
    else {
      $("#id_table-collection_terminator_1").hide().nextAll(".error-inline").addClass("hide");
    }
  });
  $("#id_table-map_key_terminator_1").css("margin-left", "4px").attr("placeholder", "在此处输入您的 Map 键终止符").hide();
  $("#id_table-map_key_terminator_0").change(function () {
    if ($(this).val() == "__other__") {
      $("#id_table-map_key_terminator_1").show();
    }
    else {
      $("#id_table-map_key_terminator_1").hide().nextAll(".error-inline").addClass("hide");
    }
  });

  // fire the event on page load
  $("#id_table-field_terminator_0").change();
  $("#id_table-collection_terminator_0").change();
  $("#id_table-map_key_terminator_0").change();

  // show the first validation error if any
  if ($(".errorlist").length > 0) {
    $(".step[href='#" + $(".errorlist").eq(0).closest(".stepDetails").attr("id") + "']").click();
  }

  $("input[name='table-row_format']").change(function () {
    $(".stepDetailsInner").hide();
    $("#step3" + $(this).val()).show();
  });

  $("input[name='table-file_format']").change(function () {
    $("#inputFormatDetails").hide();
    if ($(this).val() == "InputFormat") {
      $("#inputFormatDetails").slideDown();
    }
  });

  $("#id_table-use_default_location").change(function () {
    if (!$(this).is(":checked")) {
      $("#location").slideDown();
    }
    else {
      $("#location").slideUp();
    }
  });


  $("#step6").find("button").click(function () {
    $("#mainForm").attr("action", "#step6");
  });

  $(".columnType").find("select").change(function () {
    $(this).parents(".cnt").find(".arraySpec").hide();
    $(this).parents(".cnt").find(".mapSpec").hide();
    if ($(this).val() == "array") {
      $(this).parents(".cnt").find(".arraySpec").show();
    }
    if ($(this).val() == "map") {
      $(this).parents(".cnt").find(".mapSpec").show();
    }
  });


  $(".addColumnBtn, .addPartitionBtn").click(function (e) {
    if (!validateStep6()) {
      e.preventDefault();
    }
  });

  function validateStep6() {
    var scrollTo = 0;
    // step 6
    var step6Valid = true;
    $(".column").each(function () {
      var _field = $(this);
      if (!isValid($.trim(_field.val()))) {
        showFieldError(_field);
        if (scrollTo == 0) {
          scrollTo = $(this).position().top - $(this).closest(".well").height();
        }
        step6Valid = false;
      }
      else {
        hideFieldError(_field);
      }
      var _lastSecondErrorField = null;
      $(".column").not("[name='" + _field.attr("name") + "']").each(function () {
        if ($.trim($(this).val()) != "" && $.trim($(this).val()) == $.trim(_field.val())) {
          _lastSecondErrorField = $(this);
          if (scrollTo == 0) {
            scrollTo = _field.position().top - _field.closest(".well").height();
          }
          step6Valid = false;
        }
      });
      if (_lastSecondErrorField != null) {
        showSecondFieldError(_lastSecondErrorField);
      }
      else {
        hideSecondFieldError(_field);
      }
    });
    if (!step6Valid && scrollTo > 0) {
      $(window).scrollTop(scrollTo);
    }
    return step6Valid;
  }

  function validateForm() {
    // step 1
    var tableNameFld = $("input[name='table-name']");
    if (!isValid($.trim(tableNameFld.val()))) {
      showFieldError(tableNameFld);
      return false;
    }
    else {
      hideFieldError(tableNameFld);
    }

    // step 3
    var step3Valid = true;
    var fieldTerminatorFld = $("#id_table-field_terminator_1");
    if ($("#id_table-field_terminator_0").val() == "__other__" && (!isValid($.trim(fieldTerminatorFld.val())) || $.trim(fieldTerminatorFld.val()).length != 1)) {
      showFieldError(fieldTerminatorFld);
      step3Valid = false;
    }
    else {
      hideFieldError(fieldTerminatorFld);
    }

    var collectionTerminatorFld = $("#id_table-collection_terminator_1");
    if ($("#id_table-collection_terminator_0").val() == "__other__" && (!isValid($.trim(collectionTerminatorFld.val())) || $.trim(collectionTerminatorFld.val()).length != 1)) {
      showFieldError(collectionTerminatorFld);
      step3Valid = false;
    }
    else {
      hideFieldError(collectionTerminatorFld);
    }

    var mapKeyTerminatorFld = $("#id_table-map_key_terminator_1");
    if ($("#id_table-map_key_terminator_0").val() == "__other__" && (!isValid($.trim(mapKeyTerminatorFld.val())) || $.trim(mapKeyTerminatorFld.val()).length != 1)) {
      showFieldError(mapKeyTerminatorFld);
      step3Valid = false;
    }
    else {
      hideFieldError(mapKeyTerminatorFld);
    }
    if (!step3Valid) {
      return false;
    }

    // step 4
    var step4Valid = true;
    if ($("input[name='table-file_format']:checked").val() == "InputFormat") {
      var inputFormatFld = $("input[name='table-input_format_class']");
      if (!isValid($.trim(inputFormatFld.val()))) {
        showFieldError(inputFormatFld);
        step4Valid = false;
      }
      else {
        hideFieldError(inputFormatFld);
      }

      var outputFormatFld = $("input[name='table-output_format_class']");
      if (!isValid($.trim(outputFormatFld.val()))) {
        showFieldError(outputFormatFld);
        step4Valid = false;
      }
      else {
        hideFieldError(outputFormatFld);
      }
    }
    if (!step4Valid) {
      return false;
    }

    // step 5
    var tableExternalLocationFld = $("input[name='table-external_location']");
    if (!($("#id_table-use_default_location").is(":checked"))) {
      if (!isValid($.trim(tableExternalLocationFld.val()))) {
        showFieldError(tableExternalLocationFld);
        return false;
      }
      else {
        hideFieldError(tableExternalLocationFld);
      }
    }

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
        startPendingRequestsPolling();
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

    function startPendingRequestsPolling() {
      pendingRequestsInterval = window.setInterval(function () {
        if (hasAjaxBeenSent) {
          var activeRequests = 0;
          if (jQuery.ajax.active) {
            activeRequests = jQuery.ajax.active;
          }
          else {
            activeRequests = jQuery.active;
          }
          if (activeRequests == 0) {
            resetPrimaryButtonsStatus();
            window.clearInterval(pendingRequestsInterval);
          }
        }
        else {
          window.clearInterval(pendingRequestsInterval);
        }
      }, 200);
    }
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
$.jHueTour({
  "tours":[
    {"name": "huehomedoc", "desc": "开始", "path": "/home", "steps": [
      {"arrowOn": ".currentApp", "expose": ".navbar-fixed-top", "title": "您的新主页", "content": "在这里，您可以访问所有的文件，您可以为每个项目标记他们。您的主页是永远方便到达Hue的任何部分，只需点击顶部导航栏上的房子图标。", "placement": "bottom", "onShown": "", "waitForAction": false, "left": 90},
      {"arrowOn": ".sidebar-nav", "expose": ".sidebar-nav", "title": "活动和项目", "content": "从这里您可以创建新的文档或查看特定项目或任何丢弃的文件。", "placement": "right", "onShown": "", "waitForAction": false},
      {"arrowOn": ".tag-header:eq(0)", "expose": ".tag-header:eq(0)", "title": "组织！", "content": "在这里您可以在项目中组织和筛选您的文件出来。这是一个聪明的和快速的方式专注于您正在处理的一个特定项目。", "placement": "right", "onShown": "", "waitForAction": false},
      {"arrowOn": ".card-home", "expose": ".card-home", "title": "您的文档", "content": "您总是可以对您的辛勤工作一目了然。这是所有文件的列表，第一列告诉您什么样的文件，那么您可以找到它的名称，说明和其他一些信息。", "placement": "left", "onShown": "", "waitForAction": false, "top": "60px", "left": 40},
      {"arrowOn": ".datatables tr th:nth-child(4)", "expose": ".datatables tr td:nth-child(4)", "title": "项目", "content": "您可以通过单击该单元格分配一个或多个项目的文件。", "placement": "top", "onShown": "", "waitForAction": false, "top": -20},
      {"arrowOn": ".datatables tr th:nth-child(7)", "expose": ".datatables tr td:nth-child(7)", "title": "共享您的文件", "content": "您也可以分享您与特定用户或用户组共同操作过的文件。只需点击您要共享的每个文件该列中的图标，然后从弹出的用户和组中选择要分享给谁。", "placement": "left", "onShown": "", "waitForAction": false, "top": -20},
      {"arrowOn": "#filterInput", "expose": "#filterInput", "title": "搜索文件", "content": "您总是可以按名称，描述，甚至所有者过滤文件。享受您的新主页！", "placement": "left", "onShown": "", "waitForAction": false, "top": -10}
      ]
    },
    {
      "name": "hiveheaders",
      "desc": "创建Hive表和加载引述CSV数据",
      "path": "/hive",
      "video": "http://player.vimeo.com/video/80460405",
      "blog": "http://gethue.tumblr.com/post/68282571607/hadoop-tutorial-create-hive-tables-and-load-quoted-csv"
    },
    {
      "name": "fbooziesubmit",
      "desc": "直接从HDFS提交任何Oozie的作业",
      "path": "/(oozie|filebrowser)",
      "video": "http://player.vimeo.com/video/80749790",
      "blog": "http://gethue.tumblr.com/post/68781982681/hadoop-tutorial-submit-any-oozie-jobs-directly-from"
    },
    {
      "name": "zookeeper",
      "desc": "ZooKeeper浏览器",
      "path": "/zookeeper",
      "video": "http://player.vimeo.com/video/79795356",
      "blog": "http://gethue.tumblr.com/post/67482299450/new-zookeeper-browser-app"
    },
    {
      "name": "dbquery",
      "desc": "查询您的数据库",
      "path": "/rdbms",
      "video": "http://player.vimeo.com/video/79020016",
      "blog": "http://gethue.tumblr.com/post/66661074125/dbquery-app-mysql-and-postgresql-query-editors"
    },
    {
      "name": "searchgraph",
      "desc": "图形界面",
      "path": "/search",
      "video": "http://player.vimeo.com/video/78887745",
      "blog": "http://gethue.tumblr.com/post/66351828212/new-search-feature-graphical-facets"
    },
    {
      "name": "sentry",
      "desc": "Hive查询编辑器包含HiveServer2和Sentry",
      "path": "/(hive|impala)",
      "video": "http://player.vimeo.com/video/79883574",
      "blog": "http://gethue.tumblr.com/post/64916325309/hadoop-tutorial-hive-query-editor-with-hiveserver2-and"
    },
    {
      "name": "superproxy",
      "desc": "集成在外部任何语言的Web应用程序",
      "path": "/about",
      "video": "http://player.vimeo.com/video/79178858",
      "blog": "http://gethue.tumblr.com/post/66367939672/integrate-external-web-applications-in-any-language"
    },
    {
      "name": "season2",
      "desc": "Hadoop的视频教程2季",
      "path": "/",
      "video": "",
      "blog": "http://gethue.tumblr.com/tagged/season2"
    },
    {
      "name": "twitter",
      "desc": "分析Twitter的数据",
      "path": "/home",
      "video": "",
      "blog": "http://gethue.tumblr.com/post/48706198060/how-to-analyze-twitter-data-with-hue"
    },
    {
      "name": "pigudf",
      "desc": "准备Yelp的数据进行分析<br/>Pig 和 Python UDF",
      "path": "/(home|pig|filebrowser|metastore)",
      "video": "http://player.vimeo.com/video/73849021",
      "blog": "http://gethue.tumblr.com/post/60376973455/hadoop-tutorials-ii-1-prepare-the-data-for-analysis"
    },
    {
      "name": "saml",
      "desc": "SSO使用SAML",
      "path": "/(useradmin|about)",
      "video": "http://player.vimeo.com/video/76063637",
      "blog": "http://gethue.tumblr.com/post/62273866476/sso-with-hue-new-saml-backend"
    },
    {
      "name": "impalavshive",
      "desc": "使用Impala快速SQL",
      "path": "/impala",
      "video": "http://player.vimeo.com/video/75493693",
      "blog": "http://gethue.tumblr.com/post/62452792255/fast-sql-with-the-impala-query-editor"
    },
    {
      "name": "pigeditor",
      "desc": "Pig编辑器",
      "path": "/pig",
      "video": "http://player.vimeo.com/video/66661052",
      "blog": "http://gethue.tumblr.com/post/51559235973/tutorial-apache-pig-editor-in-hue-2-3"
    },
    {
      "name": "hiveudf",
      "desc": "在1分钟内建立和使用Hive UDF！",
      "path": "/beeswax",
      "video": "http://player.vimeo.com/video/72200781",
      "blog": "http://gethue.tumblr.com/post/58711590309/hadoop-tutorial-hive-udf-in-1-minute"
    },
    {
      "name": "hcatalog",
      "desc": "在Hue和Pig中如何使用HCatalog",
      "path": "/(metastore|pig)",
      "video": "http://player.vimeo.com/video/71024770",
      "blog": "http://gethue.tumblr.com/post/56804308712/hadoop-tutorial-how-to-access-hive-in-pig-with"
    },
    {
      "name": "hbasebrowser",
      "desc": "HBase浏览器",
      "path": "/hbase",
      "video": "http://player.vimeo.com/video/72357888",
      "blog": "http://gethue.tumblr.com/post/59071544309/the-web-ui-for-hbase-hbase-browser"
     },
     {
       "name": "hbasetables",
       "desc": "创建HBase表",
       "path": "/hbase",
       "video": "http://player.vimeo.com/video/72200782",
       "blog": "http://gethue.tumblr.com/post/58181985680/hadoop-tutorial-how-to-create-example-tables-in-hbase"
     },
     {
       "name": "oozieworkflows",
       "desc": "Oozie Workflow",
       "path": "/(oozie|beeswax)",
       "video": "http://player.vimeo.com/video/73849021",
       "blog": "http://gethue.tumblr.com/post/60937985689/hadoop-tutorials-ii-2-execute-hive-queries-and"
     },
     {
       "name": "ooziecoordinator",
       "desc": "Oozie协调器",
       "path": "/oozie",
       "video": "http://player.vimeo.com/video/74215175",
       "blog": "http://gethue.tumblr.com/post/61597968730/hadoop-tutorials-ii-3-schedule-hive-queries-with"
     },
     {
       "name": "search",
       "desc": "使用Solr的搜索应用程序",
       "path": "/search",
       "video": "http://player.vimeo.com/video/68257054",
       "blog": "http://gethue.tumblr.com/post/52804483421/tutorial-search-hadoop-in-hue"
     },
     {
       "name": "filebrowser",
       "desc": "HDFS文件操作一点通",
       "path": "/filebrowser",
       "video": "http://player.vimeo.com/video/63343487",
       "blog": "http://gethue.tumblr.com/post/48706244836/demo-hdfs-file-operations-made-easy-with-hue"
     },
     {
       "name": "hueha",
       "desc": "Hue的高可用性",
       "path": "/about",
       "video": "http://player.vimeo.com/video/71813732",
       "blog": "http://gethue.tumblr.com/post/57817118455/hadoop-tutorial-high-availability-of-hue"
     },
     {
       "name": "hue25",
       "desc": "Hue 2.5的新特性",
       "path": "/home",
       "video": "http://player.vimeo.com/video/70955652",
       "blog": "http://gethue.tumblr.com/post/55581863077/hue-2-5-and-its-hbase-app-is-out"
     },
     {
       "name": "hueperms",
       "desc": "管理用户和组的权限",
       "path": "/useradmin",
       "video": "",
       "blog": "http://gethue.tumblr.com/post/48706063756/how-to-manage-permissions-in-hue"
     },
     {
       "name": "huesqoop",
       "desc": "使用Sqoop传输数据",
       "path": "/sqoop",
       "video": "http://player.vimeo.com/video/76063637",
       "blog": "http://gethue.tumblr.com/post/63064228790/move-data-in-out-your-hadoop-cluster-with-the-sqoop"
     }
  ]
});
  viewModel = new RdbmsViewModel();
  viewModel.fetchServers();
  viewModel.fetchHiveDatabases();
   ko.applyBindings(viewModel);
function begin(){

	var data={
		rdbdatabase:$('#rdbdatabase').val(),
		rdbtable:$('#rdbtable').val(),
		hivedatabase:$('#hivedatabase').val(),
		hivetable:$('#hivetable').val(),
		data_dir:$('#data_dir').val()
	}
    var request = {
      url: 'http://10.60.1.149:4567/etl/rdbtohdfs?userid=1',
      dataType: 'jsonp',
	  jsonp:'jsonpcallback',
	  jsonpcallback:'skycallback',
      type: 'GET',
      success: function(data) {
	  alert(data);
      },
      data: data
    };
    $.ajax(request);
  };
    function hello(){alert('hello');};
    $("#rdbdatabase").change(function () {
	var name=$(this).val();
    $.each(viewModel.servers(), function(index, server) {
      if (server.name() == name) {
        viewModel.selectedServer(index);
      }
    });
    $.totalStorage('hueRdbmsLastServer', viewModel.server().name());
    viewModel.fetchDatabases();

    });
	
    $("#rdbtable").change(function () {
		viewModel.hiveTableName($(this).val());
    });
	
	

</script>
  <div id="jHueTourModal" class="modal hide fade">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h3>您知道吗？</h3>
    </div>
    <div class="modal-body">
      <div class="pull-left" style="color: #DDDDDD;font-size: 116px;margin: 10px; margin-right: 20px"><i class="fa fa-flag-checkered"></i></div>
      <div style="margin: 10px">
      <p>
        该页面中有一个或多个导览。这些导览用于引导用户浏览。
      </p>
      <p>
        You can see the list of the tours by clicking on the checkered flag icon on top right of this page. <span class="badge badge-info"><i class="fa fa-flag-checkered"></i></span>
      </p>
        </div>
    </div>
    <div class="modal-footer">
      <label class="checkbox" style="float:left"><input id="jHueTourModalChk" type="checkbox" />不再显示此对话</label>
      <a id="jHueTourModalClose" href="#" class="btn btn-primary disable-feedback">成功了！</a>
    </div>
  </div>
  </body>
</html>

