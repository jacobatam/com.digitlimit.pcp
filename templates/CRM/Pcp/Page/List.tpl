{*<div class="help">*}
    {*{ts}This screen shows all the Personal Campaign Pages that a contact has created.{/ts}*}
{*</div>*}


{*{foreach from=$contactPages.values item=pcp}*}

    {*{$pcp|@var_dump}*}
{*{/foreach}*}

{*{empty($pages)}*}


{if $pages && $pages.values }

    <div id="ltype">
        <p></p>
        {include file="CRM/common/pager.tpl" location="top"}
        {include file="CRM/common/jsortable.tpl"}

        {strip}
            <table id="options" class="display">
                <thead>
                <tr>
                    <th>{ts}Page Title{/ts}</th>
                    <th>{ts}Contribution Page / Event{/ts}</th>
                    <th>{ts}No. of Contributions{/ts}</th>
                    <th>{ts}Amount Raised{/ts}</th>
                    <th>{ts}Targeted Amount{/ts}</th>
                    <th>{ts}Status{/ts}</th>
                    <th></th>
                </tr>
                </thead>


                <tbody>
                {foreach from=$pages.values item=page}

                    <tr id="row_{$page.id}" class="{$page.class}">

                        <td>
                            <a href="{crmURL p='civicrm/pcp/info' q="reset=1&id=`$page.id`" fe='true'}" title="{ts}View Personal Campaign Page{/ts}" target="_blank">{$page.title}</a>
                        </td>

                        <td>
                            <a href="{crmURL p='civicrm/contribute/transact' q="reset=1&id=`$page.page_id`"}" title="{ts}View Contribution Page{/ts}">{$page.contribution_page_title}</a>
                        </td>

                        <td>
                            <a href="{crmURL p='civicrm/contribute/search' q="reset=1&force=1&cid=`$page.contact_id`"}" title="{ts}No. of Contributions{/ts}">{$page.no_contributions}</a>
                        </td>

                        <td>
                            {$page.amount_raised}
                        </td>

                        <td>
                            {$page.goal_amount}
                        </td>

                        <td>
                            {$page.status}
                        </td>

                        <td id={$page.id}>
                            <a href="{crmURL p='civicrm/pcp/info' q="action=update&component=`$page.page_type` &reset=1&id=`$page.id`" fe='true'}" title="{ts}Edit Personal Campaign Page{/ts}" target="_blank">{ts}Edit{/ts}</a>
                        </td>
                    </tr>

                {/foreach}
                </tbody>

            </table>
        {/strip}
    </div>

{else}

    <div class="messages status no-popup">
        <div class="icon inform-icon"></div>
        {if $isSearch}
            {ts}There are no Personal Campaign Pages which match your search criteria.{/ts}
        {else}
            {ts}There are currently no Personal Campaign Pages for this contact.{/ts}
        {/if}
    </div>

{/if}



































{*<h3>This new page is generated by CRM/Pcp/Page/List.php</h3>*}

{* Example: Display a variable directly *}
{*<p>The current time is {$currentTime}</p>*}

{* Example: Display a translated string -- which happens to include a variable *}
{*<p>{ts 1=$currentTime}(In your native language) The current time is %1.{/ts}</p>*}

{*{$contacts|@var_dump}*}





