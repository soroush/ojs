{**
 * contact.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal / Journal Contact.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="about.journalContact"}
{include file="common/header.tpl"}
{/strip}
<div id="contact">
{if !empty($journalSettings.mailingAddress)}
<div id="mailingAddress">
<h3>{translate key="common.mailingAddress"}</h3>
<p>
	{$journalSettings.mailingAddress|nl2br}
</p>
</div>
{/if}

{* CC 2010-01-14: If the current journal is Synergies (#13) we want to show
   custom contact information. *}
{if preg_match("/public\/journals\/13/", $publicFilesDir)}

<h3>Adresse locale</h3>

<p>
<strong>Revue Synergies Canada</strong><br/>
Salle 267 - B&acirc;timent MacKinnon<br/>
University of Guelph<br/>
Guelph, ON, Canada<br/>
N1G 2W1<br/>
Courriel: <a href="mailto:synergies.canada@gmail.com">synergies.canada@gmail.com</a>
</p>

<h3>Adresse du si&egrave;ge</h3>

<p>
<strong>GERFLINT 17, rue de la Ronde Mare, Le Buisson</strong><br/>
Chevalier 27240 - Sylvains les Moulins - France<br/>
Courriel: <a href="mailto:ergon27@aol.com">ergon27@aol.com</a>
</p>

<h3>Contact principal</h3>

<p>
<strong>Assistant &agrave; la r&eacute;daction</strong><br/>
Courriel: <a href="mailto:synergies.canada@gmail.com">synergies.canada@gmail.com</a>
</p>

{else}

{if not ($currentJournal->getLocalizedSetting('contactTitle') == '' && $currentJournal->getLocalizedSetting('contactAffiliation') == '' && $currentJournal->getLocalizedSetting('contactMailingAddress') == '' && empty($journalSettings.contactPhone) && empty($journalSettings.contactFax) && empty($journalSettings.contactEmail))}
<div id="principalContact">
<h3>{translate key="about.contact.principalContact"}</h3>
<p>
        {if !empty($journalSettings.contactName)}
                <strong>{$journalSettings.contactName|escape}</strong><br />
        {/if}
 
        {assign var=s value=$currentJournal->getLocalizedSetting('contactTitle')}
        {if $s}{$s|escape}<br />{/if}
 
        {assign var=s value=$currentJournal->getLocalizedSetting('contactAffiliation')}
        {if $s}{$s|escape}<br />{/if}
 
        {assign var=s value=$currentJournal->getLocalizedSetting('contactMailingAddress')}
        {if $s}{$s|nl2br}<br />{/if}
 
        {if !empty($journalSettings.contactPhone)}
                {translate key="about.contact.phone"}: {$journalSettings.contactPhone|escape}<br />
        {/if}	
	{if !empty($journalSettings.contactFax)}
		{translate key="about.contact.fax"}: {$journalSettings.contactFax|escape}<br />
	{/if}
	{if !empty($journalSettings.contactEmail)}
		{translate key="about.contact.email"}: {mailto address=$journalSettings.contactEmail|escape encode="hex"}<br />
	{/if}
</p>
{/if}

{/if} {* End check on Synergies journal *}

{if not (empty($journalSettings.supportName) && empty($journalSettings.supportPhone) && empty($journalSettings.supportEmail))}
<h3>{translate key="about.contact.supportContact"}</h3>
<p>
	{if !empty($journalSettings.supportName)}
		<strong>{$journalSettings.supportName|escape}</strong><br />
	{/if}
	{if !empty($journalSettings.supportPhone)}
		{translate key="about.contact.phone"}: {$journalSettings.supportPhone|escape}<br />
	{/if}
	{if !empty($journalSettings.supportEmail)}
		{translate key="about.contact.email"}: {mailto address=$journalSettings.supportEmail|escape encode="hex"}<br />
	{/if}
</p>
</div>
{/if}
</div>
{include file="common/footer.tpl"}

