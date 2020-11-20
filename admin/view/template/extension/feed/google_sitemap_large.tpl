<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/feed.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="google_sitemap_status">
                <?php if ($google_sitemap_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
          <tr>
            <td><?php echo $entry_data_feed; ?></td>
			<td><span class="clip"><b><span class="text"><?php echo $data_feed; ?></text></b><span class="tooltiptext"><?php echo $entry_tooltiptext; ?></span></span></td>
          </tr> 
          <tr>
            <td><?php echo $entry_cron_sitemap_status; ?></td>
            <td><select name="cron_sitemap_status">
                <?php if ($cron_sitemap_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>		  
		  <tr>
            <td><?php echo $entry_cron_feed; ?></td>
            <td><span class="clip"><b><span class="text"><?php echo $text_cron_feed; ?></text></b><span class="tooltiptext"><?php echo $entry_tooltiptext; ?></span></span></td>
          </tr>
		  <tr>
		  <td colspan="2"><span class="help"><?php echo $entry_cron_help; ?><span></td>
		  </tr>	  
        </table>
      </form>
    </div>
  </div>
</div>
<style>
.clip {
	cursor: pointer;
    position: relative;
    display: inline-block;
}




.clip .tooltiptext {
	visibility: hidden;
    background-color: rgba(0, 0, 0, 0.62);
    color: #fff;
    text-align: center;
    padding: 3px 7px;
    border-radius: 6px;
    position: absolute;
    z-index: 1;
    left: 0;
    bottom: 14px;
    font-size: 10px;	
}

.clip:hover .tooltiptext {
    visibility: visible;
}

.clip_success {
	margin-left: 10px;
    font-size: 10px;
    background: #ffb0b0;
    color: #333;
    padding: 4px;
}
</style>

<script>
$('.clip .text').on('click', function(){
	$('.clip_success').remove();  
	helper =  $(this);
	clipboard.copy($(this).text()).then(function(e){
    $(helper).after('<span class="clip_success"><?php echo $entry_copy; ?></span>');
  });
	$('.clip_success').remove(500);
});


</script>

<script>
(function(f,c){"undefined"!==typeof module?module.exports=c():"function"===typeof define&&"object"===typeof define.amd?define(c):this[f]=c()})("clipboard",function(){if(!document.addEventListener)return null;var f={};f.copy=function(){var c=!1,d=null;document.addEventListener("copy",function(b){if(c){for(var e in d)b.clipboardData.setData(e,d[e]);b.preventDefault()}});return function(b){return new Promise(function(e,h){c=!0;d="string"===typeof b?{"text/plain":b}:b instanceof Node?{"text/html":(new XMLSerializer).serializeToString(b)}:
b;try{if(document.execCommand("copy"))c=!1,d=null,e();else throw Error("Unable to copy. Perhaps it's not available in your browser?");}catch(g){c=!1,d=null,h(g)}})}}();f.paste=function(){var c=!1,d,b;document.addEventListener("paste",function(e){if(c){c=!1;e.preventDefault();var h=d;d=null;h(e.clipboardData.getData(b))}});return function(e){return new Promise(function(h,g){c=!0;d=h;b=e||"text/plain";try{document.execCommand("paste")||(c=!1,g(Error("Unable to paste. Pasting only works in Internet Explorer at the moment.")))}catch(f){c=
!1,g(Error(f))}})}}();"undefined"===typeof ClipboardEvent&&("undefined"!==typeof window.clipboardData&&"undefined"!==typeof window.clipboardData.setData)&&(function(c){function d(a,b){return function(){a.apply(b,arguments)}}function b(a){if("object"!=typeof this)throw new TypeError("Promises must be constructed via new");if("function"!=typeof a)throw new TypeError("not a function");this._value=this._state=null;this._deferreds=[];l(a,d(f,this),d(g,this))}function e(a){var b=this;return null===this._state?
void this._deferreds.push(a):void n(function(){var c=b._state?a.onFulfilled:a.onRejected;if(null===c)return void(b._state?a.resolve:a.reject)(b._value);var m;try{m=c(b._value)}catch(d){return void a.reject(d)}a.resolve(m)})}function f(a){try{if(a===this)throw new TypeError("A promise cannot be resolved with itself.");if(a&&("object"==typeof a||"function"==typeof a)){var b=a.then;if("function"==typeof b)return void l(d(b,a),d(f,this),d(g,this))}this._state=!0;this._value=a;k.call(this)}catch(c){g.call(this,
c)}}function g(a){this._state=!1;this._value=a;k.call(this)}function k(){for(var a=0,b=this._deferreds.length;b>a;a++)e.call(this,this._deferreds[a]);this._deferreds=null}function p(a,b,c,d){this.onFulfilled="function"==typeof a?a:null;this.onRejected="function"==typeof b?b:null;this.resolve=c;this.reject=d}function l(a,b,c){var d=!1;try{a(function(a){d||(d=!0,b(a))},function(a){d||(d=!0,c(a))})}catch(f){d||(d=!0,c(f))}}var n=b.immediateFn||"function"==typeof setImmediate&&setImmediate||function(a){setTimeout(a,
1)},q=Array.isArray||function(a){return"[object Array]"===Object.prototype.toString.call(a)};b.prototype["catch"]=function(a){return this.then(null,a)};b.prototype.then=function(a,c){var d=this;return new b(function(b,f){e.call(d,new p(a,c,b,f))})};b.all=function(){var a=Array.prototype.slice.call(1===arguments.length&&q(arguments[0])?arguments[0]:arguments);return new b(function(b,c){function d(e,g){try{if(g&&("object"==typeof g||"function"==typeof g)){var h=g.then;if("function"==typeof h)return void h.call(g,
function(a){d(e,a)},c)}a[e]=g;0===--f&&b(a)}catch(k){c(k)}}if(0===a.length)return b([]);for(var f=a.length,e=0;e<a.length;e++)d(e,a[e])})};b.resolve=function(a){return a&&"object"==typeof a&&a.constructor===b?a:new b(function(b){b(a)})};b.reject=function(a){return new b(function(b,c){c(a)})};b.race=function(a){return new b(function(b,c){for(var d=0,e=a.length;e>d;d++)a[d].then(b,c)})};"undefined"!=typeof module&&module.exports?module.exports=b:c.Promise||(c.Promise=b)}(this),f.copy=function(c){return new Promise(function(d,
b){if("string"!==typeof c&&!("text/plain"in c))throw Error("You must provide a text/plain type.");window.clipboardData.setData("Text","string"===typeof c?c:c["text/plain"])?d():b(Error("Copying was rejected."))})},f.paste=function(){return new Promise(function(c,d){var b=window.clipboardData.getData("Text");b?c(b):d(Error("Pasting was rejected."))})});return f});
</script>
<?php echo $footer; ?>