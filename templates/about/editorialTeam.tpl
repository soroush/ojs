{**
 * editorialTeam.tpl
 *
 * Copyright (c) 2003-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * About the Journal index.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="about.editorialTeam"}
{include file="common/header.tpl"}
{/strip}

<div id="editorialteam">

{* CC 2010-01-14: If the current journal is Synergies (#13) we want to show
   custom contact information. *}
{if preg_match("/public\/journals\/13/", $publicFilesDir)}

<h3>Pr&eacute;sident d'Honneur</h3>

<p>
Clive Thomson<br/>
Professeur chercheur agr&eacute;g&eacute;<br/>
Directeur de l'&Eacute;cole de Langues et de Litt&eacute;ratures - Universit&eacute; de Guelph
</p>

<h3>Directeur de la Publication</h3>

<p>
Jacques Cort&egrave;s, Professeur &eacute;m&eacute;rite, Pr&eacute;sident du GERFLINT
</p>

<h3>R&eacute;dactrices en chef</h3>

<p>
Fr&eacute;d&eacute;rique Arroyas - Universit&eacute; de Guelph<br/>
Margot Irvine - Universit&eacute; de Guelph<br/>
Eliane Lousada - Universit&eacute; de Guelph - Universit&eacute; de S&atilde;o Paulo<br/>
</p>

<h3>Assistant &agrave; la r&eacute;daction</h3>

<p>
Brandon Carroll
</p>

<h3>Comit&eacute; Scientifique</h3>

<p>
Janice Best (Universit&eacute; Acadia); Serge Borg (Universit&eacute; de Franche-Comt&eacute;); Patrick Chardenet (Agence Universitaire pour la Francophonie); Roland Le Huenen (Universit&eacute; de Toronto); Genevi&egrave;ve Leidelinger (Directrice de l'&eacute;cole d'enseignement de l'anglais et du fran&ccedil;ais - McGill); Fran&ccedil;ois Par&eacute; (Universit&eacute; de Waterloo); Clive Thomson (Directeur School of Languages and Literatures - Universit&eacute; de Guelph); Anthony Wall (Universit&eacute; de Calgary)
</p>


<h3>Comit&eacute; de lecture</h3>

<p>
Sophie Aubin (Universit&eacute; de Valencia) ; Catherine Black (Universit&eacute; Simon Frazer); Luc Bonenfant (Universit&eacute; du Qu&eacute;bec &agrave; Montr&eacute;al); Catherine Caws (Universit&eacute; de Victoria); Daniel Chouinard (Universit&eacute; de Guelph) ; Tara Collington (Universit&eacute; de Waterloo); Dawn Cornelio (Universit&eacute; de Guelph); Heloisa A. Costa (Universit&eacute; de S&atilde;o Paulo); Olivier Dezutter (Universit&eacute; de Sherbrooke); Tamara El-Hoss (Universit&eacute; Brock); Beth Gerwin (Universit&eacute; de Lethbridge); Rosario Gomez (Universit&eacute; de Guelph); Cynthia Harvey (Universit&eacute; du Qu&eacute;bec &agrave; Chicoutimi); Stephen Henighan (Universit&eacute; de Guelph); Rosa Hong (Universit&eacute; de Guelph); Marie-Claude Isabel (Universit&eacute; Wilfred Laurier); Jelena Jovicic (Universit&eacute; de la Colombie Britannique); Catherine Khordoc (Universit&eacute; Carleton); Kyeongmi Kim-Bernard (McEwan College); Paola Mayer (Universit&eacute; de Guelph); Dani&egrave;le Moore (Universit&eacute; Simon Frazer); Val&eacute;rie Narayana (Universit&eacute; Mount Allison); St&eacute;phanie Nutting (Universit&eacute; de Guelph); Swann Paradis (Coll&egrave;ge Glendon, Universit&eacute; York) ; Dana Paramskas (Universit&eacute; de Guelph); Anne-Martine Parent (Universit&eacute; du Qu&eacute;bec &agrave; Chicoutimi); Sandra Parmegiani (Universit&eacute; de Guelph); Maxime Prevost (Universit&eacute; d'Ottawa); Joubert Satyre (Universit&eacute; de Guelph); Karin Schwerdtner (Universit&eacute; de Western Ontario); Alain Thomas (Universit&eacute; de Guelph); Jeremy Worth (Universit&eacute; de Windsor)
</p>

{else}

{if count($editors) > 0}
	<div id="editors">
	{if count($editors) == 1}
		<h4>{translate key="user.role.editor"}</h4>
	{else}
		<h4>{translate key="user.role.editors"}</h4>
	{/if}

	<ul class="editorialTeam">
               {foreach from=$editors item=editor}
                       <li><a href="javascript:openRTWindow('{url op="editorialTeamBio" path=$editor->getId()}')">{$editor->getFullName()|escape}</a>{if $editor->getLocalizedAffiliation()}, {$editor->getLocalizedAffiliation()|escape}{/if}{if $editor->getCountry()}{assign var=countryCode value=$editor->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}</li>
               {/foreach}
       </ul>

	</div>
{/if}

{if count($sectionEditors) > 0}
	<div id="sectionEditors">
	{if count($sectionEditors) == 1}
		<h4>{translate key="user.role.sectionEditor"}</h4>
	{else}
		<h4>{translate key="user.role.sectionEditors"}</h4>
	{/if}

	<ul class="editorialTeam">
	       {foreach from=$sectionEditors item=sectionEditor}
		       <li><a href="javascript:openRTWindow('{url op="editorialTeamBio" path=$sectionEditor->getId()}')">{$sectionEditor->getFullName()|escape}</a>{if $sectionEditor->getLocalizedAffiliation()}, {$sectionEditor->getLocalizedAffiliation()|escape}{/if}{if $sectionEditor->getCountry()}{assign var=countryCode value=$sectionEditor->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}</li>
	       {/foreach}
	</ul>

	</div>
{/if}

{if count($layoutEditors) > 0}
	{if count($layoutEditors) == 1}
		<h4>{translate key="user.role.layoutEditor"}</h4>
	{else}
		<h4>{translate key="user.role.layoutEditors"}</h4>
	{/if}

{foreach from=$layoutEditors item=layoutEditor}
	<a href="javascript:openRTWindow('{url op="editorialTeamBio" path=$layoutEditor->getUserId()}')">{$layoutEditor->getFullName()|escape}</a>{if $layoutEditor->getAffiliation()}, {$layoutEditor->getAffiliation()|escape}{/if}{if $layoutEditor->getCountry()}{assign var=countryCode value=$layoutEditor->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}
	<br/>
{/foreach}
{/if}

{if count($copyEditors) > 0}
	<div id="copyEditors">
	{if count($copyEditors) == 1}
		<h4>{translate key="user.role.copyeditor"}</h4>
	{else}
		<h4>{translate key="user.role.copyeditors"}</h4>
	{/if}

	<ul class="editorialTeam">
      		{foreach from=$copyEditors item=copyEditor}
         		<li><a href="javascript:openRTWindow('{url op="editorialTeamBio" path=$copyEditor->getId()}')">{$copyEditor->getFullName()|escape}</a>{if $copyEditor->getLocalizedAffiliation()}, {$copyEditor->getLocalizedAffiliation()|escape}{/if}{if $copyEditor->getCountry()}{assign var=countryCode value
=$copyEditor->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}</li>
      		{/foreach}
	</ul>

	</div>
{/if}

{if count($proofreaders) > 0}
	<div id="proofreaders">
	{if count($proofreaders) == 1}
		<h4>{translate key="user.role.proofreader"}</h4>
	{else}
		<h4>{translate key="user.role.proofreaders"}</h4>
	{/if}
		<ul class="editorialTeam">
                {foreach from=$proofreaders item=proofreader}
                       <li><a href="javascript:openRTWindow('{url op="editorialTeamBio" path=$proofreader->getId()}')">{$proofreader->getFullName()|escape}i</a>{if $proofreader->getLocalizedAffiliation()}, {$proofreader->getLocalizedAffiliation()|escape}{/if}{if $proofreader->getCountry()}{assign var=countryCode
value=$proofreader->getCountry()}{assign var=country value=$countries.$countryCode}, {$country|escape}{/if}</li>
               {/foreach}
        	</ul>
	</div>
{/if}

{/if} {* End check on Synergies journal *}
</div>
{include file="common/footer.tpl"}
