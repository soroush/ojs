{**
 * header.tpl
 *
 * Copyright (c) 2003-2009 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site header.
 *
 * $Id: header.tpl,v 1.59.2.2 2009/04/08 19:43:31 asmecher Exp $
 *}
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
{if $pageCrumbTitle}{translate|assign:"pageCrumbTitleTranslated" key=$pageCrumbTitle}{elseif !$pageCrumbTitleTranslated}{assign var="pageCrumbTitleTranslated" value=$pageTitleTranslated}{/if}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<title>{$pageTitleTranslated}</title>
	<meta name="description" content="{$metaSearchDescription|escape}" />
	<meta name="keywords" content="{$metaSearchKeywords|escape}" />
	<meta name="generator" content="{translate key="common.openJournalSystems"} {$currentVersionString|escape}" />
	{$metaCustomHeaders}

	<link rel="stylesheet" href="{$baseUrl}/styles/common.css" type="text/css" />

	<!-- Base Jquery -->
	{if $allowCDN}<script type="text/javascript" src="http://www.google.com/jsapi"></script>
	<script type="text/javascript">{literal}
		// Provide a local fallback if the CDN cannot be reached
		if (typeof google == 'undefined') {
			document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/jquery.min.js' type='text/javascript'%3E%3C/script%3E"));
			document.write(unescape("%3Cscript src='{/literal}{$baseUrl}{literal}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js' type='text/javascript'%3E%3C/script%3E"));
		} else {
			google.load("jquery", "{/literal}{$smarty.const.CDN_JQUERY_VERSION}{literal}");
			google.load("jqueryui", "{/literal}{$smarty.const.CDN_JQUERY_UI_VERSION}{literal}");
		}
	{/literal}</script>
	{else}
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/lib/jquery/plugins/jqueryUi.min.js"></script>
	{/if}

	{call_hook|assign:"leftSidebarCode" name="Templates::Common::LeftSidebar"}
	{call_hook|assign:"rightSidebarCode" name="Templates::Common::RightSidebar"}
	{if $leftSidebarCode || $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/sidebar.css" type="text/css" />{/if}
	{if $leftSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/leftSidebar.css" type="text/css" />{/if}
	{if $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/rightSidebar.css" type="text/css" />{/if}
	{if $leftSidebarCode && $rightSidebarCode}<link rel="stylesheet" href="{$baseUrl}/styles/bothSidebars.css" type="text/css" />{/if}

	{foreach from=$stylesheets item=cssUrl}
		<link rel="stylesheet" href="{$cssUrl}" type="text/css" />
	{/foreach}

  <script type="text/javascript" src="{$baseUrl}/lib/pkp/js/general.js"></script>
  <script type="text/javascript" src="{$baseUrl}/lib/pkp/js/tag-it.js"></script>

	<!-- Add javascript required for font sizer -->
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/fontController.js" ></script>
	<script type="text/javascript">{literal}
		$(function(){
			fontSize("#sizer", "body", 9, 16, 32, "{/literal}{$basePath|escape:"javascript"}{literal}"); // Initialize the font sizer
		});
	{/literal}</script>
	<script type="text/javascript">
        // initialise plugins
        {literal}
        $(function(){
                {/literal}{if $validateId}{literal}
                        jqueryValidatorI18n("{/literal}{$baseUrl}{literal}", "{/literal}{$currentLocale}{literal}"); // include the appropriate validation lo
calization
                        $("form[name={/literal}{$validateId}{literal}]").validate({
                                errorClass: "error",
                                highlight: function(element, errorClass) {
                                        $(element).parent().parent().addClass(errorClass);
                                },
                                unhighlight: function(element, errorClass) {
                                        $(element).parent().parent().removeClass(errorClass);
                                }
                        });
                        {/literal}{/if}{literal}
                });
                {/literal}
        </script>	
	{$additionalHeadData}
  <!--
  local customization: additional stylesheets for CSI journal
  -->
  <script type="text/javascript">
  <!--
  var browser_type = navigator.appName;
  var myDirectory = '{$publicFilesDir}';
  var baseUrl = '{$baseUrl}';

  if (myDirectory.substr(myDirectory.length-1) == '2') {ldelim}
    {if $issue}
      var myIssue = '{$issue->getIssueID()}';
      if (browser_type == 'Microsoft Internet Explorer') {ldelim}
        document.write("<link href='" + baseUrl + "/public/csi/styles/issue" + myIssue + "_ie.css' type='text/css' rel='stylesheet'>");
      {rdelim} else {ldelim}
        document.write("<link href='" + baseUrl + "/public/csi/styles/issue" + myIssue + ".css' type='text/css' rel='stylesheet'>");
      {rdelim}
    {/if}
  {rdelim}
  -->
  </script>

</head>
<body>
<div id="container">

<div id="header">
<div id="headerTitle">
<h1>
{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
	<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" width="{$displayPageHeaderLogo.width|escape}" height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if} />
{/if}
{if $displayPageHeaderTitle && is_array($displayPageHeaderTitle)}
	<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" width="{$displayPageHeaderTitle.width|escape}" height="{$displayPageHeaderTitle.height|escape}" {if $displayPageHeaderTitle.altText != ''}alt="{$displayPageHeaderTitle.altText|escape}"{else}alt="{translate key="common.pageHeader.altText"}"{/if} />
{elseif $displayPageHeaderTitle}
	{$displayPageHeaderTitle}
{elseif $alternatePageHeader}
	{$alternatePageHeader}
{elseif $siteTitle}
	{$siteTitle}
{else}
	{translate key="common.openJournalSystems"}
{/if}
</h1>
</div>
</div>

<div id="body">

{if $leftSidebarCode || $rightSidebarCode}
	<div id="sidebar">
		{if $leftSidebarCode}
			<div id="leftSidebar">
				{$leftSidebarCode}
			</div>
		{/if}
		{if $rightSidebarCode}
			<div id="rightSidebar">
				{$rightSidebarCode}
			</div>
		{/if}
	</div>
{/if}

<div id="main">
<div id="navbar">
	<ul class="menu">

		{* CC 2010-01-14: Only show the home link for Synergies *}
		{if preg_match("/public\/journals\/13/", $publicFilesDir)}

		<li><a href="{url page="index"}">{translate key="navigation.home"}</a></li>

		{/if}

		<li><a href="{url page="about"}">{translate key="navigation.about"}</a></li>
<!-- 
	local customization: add contact link
-->
		{* CC 2010-01-14: Remove contact link for the Synergies journal (#13) *}
		{if ! preg_match("/public\/journals\/13/", $publicFilesDir)}

		<li><a href="{url page="about"}/contact">contact</a></li>

		{/if}

		{if $isUserLoggedIn}
			<li><a href="{url page="user"}">{translate key="navigation.userHome"}</a></li>
		{else}

			{* CC 2010-01-15: Remove login link for the Synergies journal (#13) *}
			{if ! preg_match("/public\/journals\/13/", $publicFilesDir)}

			<li><a href="{url page="login"}">{translate key="navigation.login"}</a></li>

			{/if}

			<li><a href="{url page="user" op="register"}">{translate key="navigation.register"}</a></li>

		{/if}{* $isUserLoggedIn *}

		{* CC 2010-01-15: Remove search link for the Synergies journal (#13) *}
		{if ! preg_match("/public\/journals\/13/", $publicFilesDir)}

		<li><a href="{url page="search"}">{translate key="navigation.search"}</a></li>

		{/if}

		{if $currentJournal}
			<li><a href="{url page="issue" op="current"}">{translate key="navigation.current"}</a></li>
			<li><a href="{url page="issue" op="archive"}">{translate key="navigation.archives"}</a></li>
		{/if}{* $currentJournal *}

		{if $enableAnnouncements}
			<li><a href="{url page="announcement"}">{translate key="announcement.announcements"}</a></li>
		{/if}{* enableAnnouncements *}

		{call_hook name="Templates::Common::Header::Navbar::CurrentJournal"}

		{foreach from=$navMenuItems item=navItem}
			{if $navItem.url != '' && $navItem.name != ''}
				<li><a href="{if $navItem.isAbsolute}{$navItem.url|escape}{else}{$navItem.url|escape}{/if}">{if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}</a></li>
			{/if}
		{/foreach}
	</ul>
</div>

<div id="breadcrumb">
	<a href="{url page="index"}">{translate key="navigation.home"}</a> &gt;
	{foreach from=$pageHierarchy item=hierarchyLink}
		<a href="{$hierarchyLink[0]|escape}" class="hierarchyLink">{if not $hierarchyLink[2]}{translate key=$hierarchyLink[1]}{else}{$hierarchyLink[1]|escape}{/if}</a> &gt;
	{/foreach}
	<a href="{$currentUrl|escape}" class="current">{$pageCrumbTitleTranslated}</a>
</div>

<!--
	local customization: added id to h2
-->
<h2 id="pageTitle">{$pageTitleTranslated}</h2>

{if $pageSubtitle && !$pageSubtitleTranslated}{translate|assign:"pageSubtitleTranslated" key=$pageSubtitle}{/if}
{if $pageSubtitleTranslated}
	<h3>{$pageSubtitleTranslated}</h3>
{/if}

<div id="content">
