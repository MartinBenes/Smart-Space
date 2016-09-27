{block name="title" prepend}{$LNG.lm_alliance}{/block}
{block name="content"}
<form action="game.php?page=alliance&amp;mode=admin&amp;action=membersSave" method="post">


							<!-- Widget ID (each widget will need unique ID)-->
							<div class="jarviswidget jarviswidget-color-blueDark" id="wid-id-0" data-widget-editbutton="false">
								<header>
									<span class="widget-icon"> <i class="fa fa-users"></i> </span>
									<h2>{$LNG.lm_alliance}</h2>

								</header>

								<!-- widget div-->
								<div>

									<!-- widget edit box -->
									<div class="jarviswidget-editbox">
										<!-- This area used as dropdown edit box -->

									</div>
									<!-- end widget edit box -->

									<!-- widget content -->
									<div class="widget-body">
										
										<div class="table-responsive">
										
											<table class="table table-bordered">
												<thead>
													<tr>
			<th>{$LNG.al_num}</th>
			<th>{$LNG.al_member}</th>
			<th>{$LNG.al_message}</th>
			<th>{$LNG.al_position}</th>
			<th>{$LNG.al_points}</th>
			<th>{$LNG.al_coords}</th>
			<th>{$LNG.al_member_since}</th>
			<th>{$LNG.al_estate}</th>
			<th>{$LNG.al_actions}</th>
													</tr>
												</thead>
												<tbody>
	{foreach $memberList as $userID => $memberListRow}
	<tr>
		<td>{$memberListRow@iteration}</td>
		<td><a href="#" onclick="return Dialog.Playercard({$userID}, '{$memberListRow.username}');">{$memberListRow.username}</a></td>
		<td><a href="#" onclick="return Dialog.PM({$userID});"><img src="{$dpath}img/m.gif" border="0" title="{$LNG.write_message}"></a></td>
		<td>{if $memberListRow.rankID == -1}{$founder}{else}{html_options name="rank[{$userID}]" options=$rankList selected=$memberListRow.rankID}{/if}</td>
		<td><span title="{$memberListRow.points|number}">{shortly_number($memberListRow.points)}</span></td>
		<td><a href="game.php?page=galaxy&amp;galaxy={$memberListRow.galaxy}&amp;system={$memberListRow.system}">[{$memberListRow.galaxy}:{$memberListRow.system}:{$memberListRow.planet}]</a></td>
		<td>{$memberListRow.register_time}</td>
		<td>{if $rights.ONLINESTATE}{if $memberListRow.onlinetime < 4}<span style="color:lime">{$LNG.al_memberlist_on}</span>{elseif $memberListRow.onlinetime >= 4 && $memberListRow.onlinetime <= 15}<span style="color:yellow">{$memberListRow.onlinetime} {$LNG.al_memberlist_min}</span>{else}<span style="color:red">{$LNG.al_memberlist_off}</span>{/if}{else}-{/if}</td>
		<td>{if $memberListRow.rankID != -1}<input type="image" src="{$dpath}pic/key.gif" border="0" alt="" title="{$LNG.al_save}">
		{if $canKick}<a href="game.php?page=alliance&amp;mode=admin&amp;action=membersKick&amp;id={$userID}" onclick="return confirm('{$memberListRow.kickQuestion}');" style="border: 1px solid #212121;vertical-align:top;width:16px;height:16px;display:inline-block;margin:2px;"><img src="{$dpath}pic/abort.gif" border="0" alt=""></a>{/if}{else}-{/if}
		</td>
	</tr>
	{/foreach}
	</tbody>
											</table>
											
										</div>
									</div>
									<!-- end widget content -->

								</div>
								<!-- end widget div -->

							</div>
							<!-- end widget -->



</form>
{/block}
{block name="script" append}
<script src="scripts/base/jquery.tablesorter.js"></script>
<script>$(function() {
    $("#memberList").tablesorter({
		headers: { 
			0: { sorter: false } ,
			3: { sorter: false } ,
			9: { sorter: false } ,
		},
		debug: false
	}); 
});</script>
{/block}