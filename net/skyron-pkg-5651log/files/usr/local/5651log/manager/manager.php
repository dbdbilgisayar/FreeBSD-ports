<?php 

/*
 * Copyright (c) 2021 M.Demir Heraklet
 * Modified by Mehmet Demir
 * Heraklet Security
 * www.heraklet.com
 * info@heraklet.com
*/

ob_start();
require_once("guiconfig.inc"); 
require_once("functions.inc"); 
$pgtitle = array(gettext("hotspot"), gettext("hotspot Rapor")); 
include("head.inc");


?>

	<head>
		<title></title>

		<style type="text/css">
		
			/*** COLORS ***/
			<?php 
			if ($externalStylesheet=="") {
			?>
			body.snif {
				background: #ffffff;             /* background behind table */
			}
			table.snif {
				border: 0px solid #990000;       /* main table border style */
			}
			td.snDir {
				color: #ffffff;                  /* table header text color */
				background-color: #f5f1f2;       /* table header background color */
			}
			td.snDir a {
				color:white;                     /* link text color within table header */
			}
			tr.snHeading, td.snHeading, td.snHeading a {
				color: #FFFFFF;                  /* column headings text color */
				background-color: #000000;       /* column headings background color */
			}
			tr.snF td a {
				color: #000000;                  /* file listing link text color (filename)*/
			}
			tr.snF td a:hover, a.snif:hover {
				/*background-color: #bbbbee;    */   /* file listing link hover background color */
			}
			tr.snEven {
				background-color: #eef4f6;       /* file listing background color for even numbered rows */
			}
			tr.snOdd {
				background-color: #FFF;       /* file listing background color for odd numbered rows */
			}
			tr.snF td {
				color: #990000;                  /* file listing text color */
			}
			.snCopyright * {
				color: #bbbbbb;                  /* copyright notice text color */
			}
			.snWhite {
				color: white;                    /* active page in paging header */
			}
			<?php 
			}
			?>
			
			/*** FONTS ***/
			.snif * {
				font-family: Tahoma, Sans-Serif;
				font-size: 10pt;
			}
			.snif a, a.snif {
				text-decoration: none;
			}
			.snif a:hover, a.snif:hover {
				text-decoration: underline;
			}
			.snCopyright * {
				font-size: 8pt;
			}
			.snifSmaller {
				font-weight: normal;
				font-size: 8pt;
			}
			td.snDir {
				font-weight: bold;
			}
			tr.snHeading, td.snHeading, td.snHeading a {
				font-weight: bold;
			}
			
			
			/*** MARGINS AND POSITIONS ***/
			table.snif {
				<?php 
				if ($tableWidth100Percent) {
					echo "width:100%;";
				}
				?>
			}
			table.snif td {
				padding-left: 10px;
				padding-right: 10px;
			}
			table.snif td.littlepadding {
				padding-left: 4px;
				padding-right: 0px;
			}
			td.snDir {
				padding-top: 3px;
				padding-bottom: 3px;
			}
			tr.snHeading, td.snHeading, td.snHeading a {
				padding-top: 3px;
				padding-bottom: 3px;
			}
			tr.snF td {
				padding-top: 2px;
				padding-bottom: 2px;
				vertical-align: top;
				padding-left: 10px;
				padding-right: 10px;
				white-space: nowrap;
			}
			.snif img {
				border:none;
			}
			.snW {
				white-space: normal;
			}
		</style>
	</head>

<table cellpadding="0" cellspacing="0" class="snif">
	<tr>
		<td class="snDir" colspan="">
<br/>
			<span class="snifSmaller"></span>
		</td>
	</tr>


	<tr class="snHeading">

	</tr>

	<tr class="snF ">

	</tr>
	<tr class="snHeading">
		<td class="snHeading" colspan="">
		</td>
	</tr>

</table>

<?php include("foot.inc");
?>

