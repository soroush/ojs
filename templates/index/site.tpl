{**
 * site.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 * $Id$
 *}
{strip}
{if $siteTitle}
	{assign var="pageTitleTranslated" value=$siteTitle}
{/if}
{include file="common/header.tpl"}
{/strip}

<!-- 
	local customization: redirect to journal URLs
-->
<script type="text/javascript">
<!--
if (location=='http://www.criticalimprov.com/') {ldelim}
	location.href="http://www.criticalImprov.com/public/csi/index.html";
{rdelim} 
if (location=='http://gir.uoguelph.ca/') {ldelim}
	location.href="http://gir.uoguelph.ca/index.php/gir";
{rdelim} 
if (location=='http://www.irss.uoguelph.ca/') {ldelim}
	location.href="http://www.irss.uoguelph.ca/index.php/irss/issue/current";
{rdelim} 
// -->
</script>

<br />

{if $intro}
<p>{$intro|nl2br}</p>
{/if}

{iterate from=journals item=journal}

	{assign var="displayHomePageImage" value=$journal->getLocalizedSetting('homepageImage')}
	{assign var="displayHomePageLogo" value=$journal->getLocalizedPageHeaderLogo(true)}
        {assign var="displayPageHeaderLogo" value=$journal->getLocalizedPageHeaderLogo()}

	<h3>{$journal->getLocalizedTitle()|escape}</h3>
	<p><a href="{url journal=$journal->getPath()}" class="action">{translate key="site.journalView"}</a> | <a href="{url journal=$journal->getPath() page="issue" op="current"}" class="action">{translate key="site.journalCurrent"}</a> | <a href="{url journal=$journal->getPath() page="user" op="register"}" class="action">{translate key="site.journalRegister"}</a></p>
{/iterate}

{include file="common/footer.tpl"}
