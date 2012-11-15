{**
 * displayMembership.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display group membership information.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="about.people"}
{include file="common/header.tpl"}
{/strip}

<div id="displayMembership">
<h4>{$group->getGroupTitle()}</h4>
{assign var=groupId value=$group->getGroupId()}

{**
 * Local customization - Removed link from user name. 
 *}
{foreach from=$memberships item=member}
	{assign var=user value=$member->getUser()}
	<div id="member">
	{$user->getFullName()|escape}{if $user->getLocalizedAffiliation()}, {$user->getLocalizedAffiliation()|escape}{/if}{if $user->getCountry()}{assign var=countryCode value=$user->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}
	</div>
	<br />
{/foreach}
</div>

{include file="common/footer.tpl"}
